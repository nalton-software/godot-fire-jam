extends Area2D

export (Script) var item_script
var item_data

func _ready():
	item_data = item_script.new()
	print(item_data.name)
