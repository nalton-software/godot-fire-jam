extends TextureRect

export (bool) var in_inventory = false
var item: Item = null
var mouse_down := false
var drag_item_prefab := preload('res://scenes/items/DragItem.tscn')

func set_item(p_item: Item, already_in_inventory: bool = false):
	item = p_item
	if in_inventory and not already_in_inventory:
		Inventory.set_item_at_index(item, get_index(), true)
	$TextureRect.texture = item.texture

func remove_item():
	item = null
	$TextureRect.texture = null

func is_empty():
	return item == null
	
func item_name():
	if item == null:
		return null
	else:
		return item.name

func _on_ItemSlot_gui_input(event):
	if event is InputEventMouseButton:
		mouse_down = not mouse_down
		if item != null:
			var drag_item = drag_item_prefab.instance()
			drag_item.item = item
			get_tree().get_nodes_in_group('DragItemHolder')[0].add_child(drag_item)
			
			# Don't touch this or the inventory or it will break
			if in_inventory:
				Inventory.remove_item(get_index())
			else:
				remove_item()
