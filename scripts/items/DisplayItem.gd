extends Area2D

export var item_script: Script

onready var HUD = $"/root/Main/HUD"

var item_data

func _enter_tree():
	if item_data == null:
		item_data = item_script.new()
	$Sprite.texture = item_data.texture
	$Sprite.scale.x = item_data.size.x / item_data.texture.get_width()
	$Sprite.scale.y = item_data.size.y / item_data.texture.get_height()
	$CollisionShape2D.shape.extents = item_data.size / 2

func _on_DisplayItem_body_entered(body):
	if body.is_in_group('Players'):
		if HUD.add_item(item_data):
			queue_free()
