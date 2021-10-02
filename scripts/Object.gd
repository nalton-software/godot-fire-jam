extends StaticBody2D

export var spawn_offset := Vector2.ZERO
export var toughness := 1.0
export var item_script: Script

onready var original_pos := position
onready var item_prefab := preload("res://scenes/DisplayItem.tscn")

var mining := false
var mining_progress := 0.0

func _process(delta: float) -> void:
	if mining:
		mining_progress += delta
		if mining_progress > toughness:
			destroy()
			
		position = Utils.shake_once(original_pos,  mining_progress / toughness * 5.0)
	
func _on_Area2D_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		mining = event.pressed
		mining_progress = 0.0
		position = original_pos

func destroy():
	var item = item_prefab.instance()
	item.position = position + spawn_offset
	item.item_script = item_script
	get_parent().add_child(item)
	queue_free()
