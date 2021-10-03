extends Area2D

export var item_name: String

var item

func _enter_tree():
	if item == null and item_name != '':
		item = Items.data[item_name]
	elif item != null:
		item_name = item.name
	else:
		printerr('Error: WorldItem has no item assigned')
	$Sprite.texture = item.texture
	$Sprite.scale.x = item.size.x / item.texture.get_width()
	$Sprite.scale.y = item.size.y / item.texture.get_height()
	$CollisionShape2D.shape.extents = item.size / 2

func _on_DisplayItem_body_entered(body):
	if body.is_in_group('Players'):
		var item_taken = body.collect(item)
		if item_taken:
			queue_free()

