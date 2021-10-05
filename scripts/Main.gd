extends Node2D

export (String) var target_item_name = '' # name of the target item to create in this level
export (String, MULTILINE) var finished_level_text = ''

# things for testing
export (bool) var should_spawn_testing_objects = true
export (int) var num_objects = 300
export (Vector2) var max_object_distance = Vector2(2500, 1250)
export (Array, PackedScene) var objects_to_spawn = []

func _ready():
	randomize()
	
	if should_spawn_testing_objects:
		spawn_testing_objects()
	
	if target_item_name == '':
		printerr('Didn\'t specify target item name of scene %s' % name)
		return
		
	$HUD.set_target_item(Items.data[target_item_name])

func _process(delta: float):
	for item in Inventory.items:
		if item == null:
			continue
		if item.name == target_item_name:
			LevelManagement.transition_to_next_level()
	
func spawn_testing_objects():
	for i in range(num_objects):
		var obj = objects_to_spawn[randi() % len(objects_to_spawn)].instance()
		obj.position = Vector2(
			rand_range(-max_object_distance.x, max_object_distance.x),
			rand_range(-max_object_distance.y, max_object_distance.y)
		)
		$YSort.add_child(obj)
