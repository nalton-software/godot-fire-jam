extends StaticBody2D

export var spawn_offset := Vector2.ZERO
export var toughness := 1.0
export var item_name: String

onready var original_pos := position
onready var world_item_prefab := preload("res://scenes/items/WorldItem.tscn")

var item: Resource

var mouse_on := false
var mouse_down := false
var mining_progress := 0.0
var max_mining_dist = 200

func _ready():
	item = Items.data[item_name]

func _process(delta: float) -> void:
	var players = get_tree().get_nodes_in_group('Players')
	if len(players) == 0:
		return
	var player = players[0]
	var player_is_close = global_position.distance_to(player.global_position) < max_mining_dist
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and mouse_on and player_is_close:
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
	var world_item = world_item_prefab.instance()
	world_item.position = position + spawn_offset
	world_item.item = item
	get_parent().add_child(world_item)
	queue_free()
