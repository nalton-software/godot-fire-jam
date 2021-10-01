extends KinematicBody2D

export var speed := 10.0

func _physics_process(delta):
	var direction := Vector2.ZERO
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	direction = direction.normalized()
	
	move_and_slide(direction * speed * delta)
