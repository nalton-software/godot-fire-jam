extends TextureRect

onready var item_node = $Item
onready var original_pos = item_node.rect_position
onready var mouse_offset = (item_node.rect_size / 2) - item_node.rect_position
onready var world_item_prefab := preload("res://scenes/items/WorldItem.tscn")

var mouse_down := false
var item: Item

func _process(delta: float) -> void:
	if mouse_down:
		var mouse_pos = get_local_mouse_position() - mouse_offset
		item_node.rect_position = mouse_pos

func set_item(p_item: Item):
	item = p_item
	item_node.texture = item.texture
	
func remove_item():
	item_node.texture = null
	item = null

func _on_Item_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and item != null:
		if event.pressed:
			# put item on top of everything (through code since no editor variable)
			VisualServer.canvas_item_set_z_index(item_node.get_canvas_item(), 100)
		# has been dragging
		elif mouse_down != event.pressed:
			item_node.rect_position = original_pos
			
			var world_item = world_item_prefab.instance()
			world_item.item = item
			var object_container = get_tree().current_scene.get_node('YSort')
			world_item.position = object_container.get_global_mouse_position()
			object_container.add_child(world_item)
			Inventory.remove_item(get_index())
				
		mouse_down = event.pressed
