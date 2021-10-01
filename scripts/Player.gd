extends KinematicBody2D

export var acceleration := 1000.0
export var max_speed := 500.0
export var friction := 10.0

var velocity = Vector2.ZERO

func _physics_process(delta):
	var direction := Vector2.ZERO
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	direction = direction.normalized()
	
	if direction == Vector2.ZERO:
		# friction
		velocity.x = Utils.converge_value(velocity.x, 0, friction)
		velocity.y = Utils.converge_value(velocity.y, 0, friction)
	else:
		velocity += direction * acceleration * delta
		velocity = velocity.clamped(max_speed)
	velocity = move_and_slide(velocity)
