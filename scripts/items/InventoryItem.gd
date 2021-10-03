extends TextureRect

var dragging_item := false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and dragging_item:
		$Item.rect_position = get_local_mouse_position()

func set_item(item_data: ItemData):
	$Item.texture = item_data.texture
	remove_from_group("Empty")

func _on_Item_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		dragging_item = event.pressed
