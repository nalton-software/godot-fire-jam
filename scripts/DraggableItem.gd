extends TextureRect

var item: Item
onready var mouse_offset = (rect_size / 2) - rect_position
var mouse_down := false
const world_item_prefab := preload("res://scenes/items/WorldItem.tscn")
var snap_threshold = 50

func _process(delta: float) -> void:
	if mouse_down:
		var mouse_pos = get_local_mouse_position() - mouse_offset
		rect_position = mouse_pos

func on_released():
	var slot = null
	for crnt_slot in get_tree().get_nodes_in_group('ItemSlots'):
		pass
		
	if slot != null:
		pass
	else:
		var world_item = world_item_prefab.instance()
		world_item.item = item
		var object_container = get_tree().current_scene.get_node('YSort')
		world_item.position = object_container.get_global_mouse_position()
		object_container.add_child(world_item)
		Inventory.remove_item(get_index())

func _on_Item_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and item != null:
		if event.pressed:
			# put item on top of everything (through code since no editor variable)
			VisualServer.canvas_item_set_z_index(get_canvas_item(), 100)
		# has been dragging
		elif mouse_down != event.pressed:
			on_released()
				
		mouse_down = event.pressed
