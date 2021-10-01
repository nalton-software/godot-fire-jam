extends KinematicBody2D

export var max_speed := 350
export var acceleration := 1500
export var friction := 2000

var velocity = Vector2.ZERO

func _ready():
	$AnimatedSprite.playing = true

func _physics_process(delta):
	var direction := Vector2.ZERO
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	direction = direction.normalized()
	
	if direction == Vector2.ZERO:
		# friction
		velocity.x = Utils.converge_value(velocity.x, 0, friction * delta)
		velocity.y = Utils.converge_value(velocity.y, 0, friction * delta)
	else:
		velocity += direction * acceleration * delta
		velocity = velocity.clamped(max_speed)
	switch_animation()
	velocity = move_and_slide(velocity)

func switch_animation():
	$AnimatedSprite.flip_h = false
	$AnimatedSprite.playing = true
	if velocity == Vector2.ZERO:
		$AnimatedSprite.playing = false
	elif abs(velocity.x) >= abs(velocity.y):
		$AnimatedSprite.animation = 'walk_side'
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y > 0:
		$AnimatedSprite.animation = 'walk_down'
	elif velocity.y < 0:
		$AnimatedSprite.animation = 'walk_up'
	$AnimatedSprite.speed_scale = velocity.length() / max_speed
