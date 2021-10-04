extends TextureRect

var item: Item
onready var mouse_offset = Vector2(25, 25)
const world_item_prefab := preload("res://scenes/items/WorldItem.tscn")
var snap_threshold = 100
const scale = Vector2(3, 3)

func _process(delta: float) -> void:
	texture = item.texture
	
	var mouse_pos = get_global_mouse_position() - mouse_offset
	rect_global_position = mouse_pos
	rect_scale = scale
	VisualServer.canvas_item_set_z_index(get_canvas_item(), 100)

func on_released():
	var slot = null
	for crnt_slot in get_tree().get_nodes_in_group('ItemSlots'):
		if crnt_slot.rect_global_position.distance_to(rect_global_position) < snap_threshold:
			slot = crnt_slot
			break
		
	if slot != null:
		slot.set_item(item)
		queue_free()
	else:
		pass
		var world_item = world_item_prefab.instance()
		world_item.item = item
		var object_container = get_tree().current_scene.get_node('YSort')
		world_item.position = object_container.get_global_mouse_position()
		object_container.add_child(world_item)
	queue_free()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		# Since this class is only used when the mouse is down, we assume that the next event is an up
		on_released()
