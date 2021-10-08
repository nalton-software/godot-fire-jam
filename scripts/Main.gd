tool

extends Node2D

export (String) var target_item_name = '' # name of the target item to create in this level
export (String, MULTILINE) var finished_level_text = ''
export (int) var left_boundary = -1000
export (int) var top_boundary = -1000
export (int) var right_boundary = 1000
export (int) var bottom_boundary = 1000
var already_finished = false

# Freeplay objects
export (bool) var is_freeplay = false
export (int) var num_freeplay_objects = 300
export (Vector2) var max_freeplay_object_distance = Vector2(2500, 1250)
export (Array, PackedScene) var freeplay_objects_to_spawn = []

func _ready():
	create_boundary()
	
	if Engine.editor_hint:
		return
	if target_item_name == '':
		printerr('Didn\'t specify target item name of scene %s' % name)
	
	if is_freeplay:
		spawn_freeplay_objects()
		
	if target_item_name == '':
		$HUD.set_target_item(null)
	else:
		$HUD.set_target_item(Items.data[target_item_name])

func _draw():
	if Engine.editor_hint:
		var rect_size = Vector2(right_boundary, bottom_boundary) - \
			Vector2(left_boundary, top_boundary)
		var rect_position = Vector2(left_boundary, top_boundary)
		var rect = Rect2(rect_position, rect_size)
		draw_rect(rect, Color(0, 0, 1, 0.2), true)

func _process(delta: float):
	if Engine.editor_hint:
		return
	$YSort/Player.frozen = $HUD/CraftingMenu.is_visible_in_tree()
	for item in Inventory.items:
		if item == null:
			continue
		if item.name == target_item_name and not already_finished:
			already_finished = true
			LevelManagement.transition_to_next_level()

func create_boundary():
	var body = StaticBody2D.new()
	add_child(body)
	var collider = CollisionPolygon2D.new()
	collider.visible = false
	collider.build_mode = collider.BUILD_SEGMENTS
	collider.polygon = PoolVector2Array([
		Vector2(left_boundary, top_boundary),
		Vector2(right_boundary, top_boundary),
		Vector2(right_boundary, bottom_boundary),
		Vector2(left_boundary, bottom_boundary),
		Vector2(left_boundary, top_boundary)
	])
	
	body.add_child(collider)

func spawn_freeplay_objects():
	for i in range(num_freeplay_objects):
		var obj = freeplay_objects_to_spawn[randi() % len(freeplay_objects_to_spawn)].instance()
		obj.position = Vector2(
			rand_range(-max_freeplay_object_distance.x, max_freeplay_object_distance.x),
			rand_range(-max_freeplay_object_distance.y, max_freeplay_object_distance.y)
		)
		$YSort.add_child(obj)
