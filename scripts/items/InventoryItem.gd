extends TextureRect

export var item_script: Script

var item_data

func _enter_tree():
	if item_data == null:
		item_data = item_script.new()
	
	texture = item_data.texture
