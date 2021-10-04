extends TextureRect

onready var item_node = $Item
onready var original_pos = item_node.rect_position
onready var mouse_offset = (item_node.rect_size / 2) - item_node.rect_position
onready var world_item_prefab := preload("res://scenes/items/WorldItem.tscn")

var dragging_item := false
var item: Item

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and dragging_item:
		var mouse_pos = get_local_mouse_position() - mouse_offset
		item_node.rect_position = mouse_pos

func set_item(p_item: Item):
	item = p_item
	item_node.texture = item.texture
	remove_from_group("Empty")
	add_to_group('Filled')
	
func remove_item():
	item_node.texture = null
	add_to_group("Empty")
	remove_from_group('Filled')

func _on_Item_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		dragging_item = event.pressed
		if dragging_item:
			# put item on top of everything (through code since no editor variable)
			VisualServer.canvas_item_set_z_index(item_node.get_canvas_item(), 100)
		else:
			item_node.rect_position = original_pos
			
			var world_item = world_item_prefab.instance()
			world_item.item = item
			var object_container = get_tree().current_scene.get_node('YSort')
			world_item.position = object_container.get_global_mouse_position()
			object_container.add_child(world_item)
			Inventory.remove_item(item)
