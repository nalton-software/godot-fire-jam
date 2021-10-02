extends StaticBody2D

export var item_prefab: PackedScene

func _on_Area2D_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton && event.pressed:
		var item = item_prefab.instance()
		item.position = position
		get_parent().add_child(item)
		queue_free()
