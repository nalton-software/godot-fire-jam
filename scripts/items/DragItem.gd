extends TextureRect

var item: Item
const world_item_prefab := preload("res://scenes/items/WorldItem.tscn")
var snap_threshold = 100
const scale = Vector2(3, 3)

func _process(delta: float) -> void:
	texture = item.texture
	
	var mouse_pos = get_global_mouse_position() - rect_size / 2
	rect_global_position = mouse_pos
	rect_scale = scale
	
	# Move to front through code because it can't be done through ui
	VisualServer.canvas_item_set_z_index(get_canvas_item(), 100)

func on_released():
	var slot = null
	var self_middle = rect_global_position + (rect_size / 2)
	for crnt_slot in get_tree().get_nodes_in_group('ItemSlots'):
		# Skip slots that are hidden or filled
		if not (crnt_slot.is_visible_in_tree() and crnt_slot.is_empty()):
			continue
		var crnt_slot_bottom_right = crnt_slot.rect_global_position + crnt_slot.rect_size
		if crnt_slot.rect_global_position.x < self_middle.x and \
			crnt_slot.rect_global_position.y < self_middle.y and \
			self_middle.x < crnt_slot_bottom_right.x and \
			self_middle.y < crnt_slot_bottom_right.y:
			slot = crnt_slot
			break
		
	if slot != null:
		slot.set_item(item)
		slot.item_just_dragged = true
		queue_free()
	else:
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
