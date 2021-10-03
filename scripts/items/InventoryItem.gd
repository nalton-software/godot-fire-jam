extends TextureRect

func set_item(item_data: ItemData):
	$Item.texture = item_data.texture
	remove_from_group("Empty")
