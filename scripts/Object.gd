extends StaticBody2D

export var spawn_offset := Vector2.ZERO
export var toughness := 1.0
export var item_script: Script

onready var original_pos := position
onready var item_prefab := preload("res://scenes/DisplayItem.tscn")

var mouse_on := false
var mouse_down := false
var mining_progress := 0.0

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and mouse_on:
		mining_progress += delta
		if mining_progress > toughness:
			destroy()
	else:
		mining_progress = max(0.0, mining_progress - delta * 1.5)
	
	if mining_progress == 0:
		position = original_pos
	else:
		position = Utils.shake_once(original_pos,  mining_progress / toughness * 5.0)

func _on_Area2D_mouse_entered() -> void:
	mouse_on = true

func _on_Area2D_mouse_exited() -> void:
	mouse_on = false

func destroy():
	var item = item_prefab.instance()
	item.position = position + spawn_offset
	item.item_script = item_script
	get_parent().add_child(item)
	queue_free()
