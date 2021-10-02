extends KinematicBody2D

export var max_speed := 350
export var acceleration := 1500
export var friction := 2000
export var shift_multiplier := 1.5
var direction = 'right'

onready var HUD = owner.get_node("HUD")

var velocity = Vector2.ZERO

func _ready():
	$AnimatedSprite.playing = true

func _physics_process(delta):
	var direction := Vector2.ZERO
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	direction = direction.normalized()
	
	# Friction
	if direction.x == 0:
		velocity.x = Utils.converge_value(velocity.x, 0, friction * delta)
	if direction.y == 0:
		velocity.y = Utils.converge_value(velocity.y, 0, friction * delta)
	
	velocity += direction * get_real_shift(acceleration) * delta
	velocity = velocity.clamped(get_real_shift(max_speed))
	
	check_direction()
	switch_animation()
	velocity = move_and_slide(velocity)

func get_real_shift(value: float):
	if Input.is_action_pressed("ui_shift"):
		return value * shift_multiplier
	else:
		return value
	
func switch_animation():
	var action
	if velocity == Vector2.ZERO:
		action = 'still'
	else:
		action = 'walk'
	
	var _direction = direction
	$AnimatedSprite.flip_h = false
	if direction == 'left':
		_direction = 'side'
		$AnimatedSprite.flip_h = true
	elif direction == 'right':
		_direction = 'side'
		
	$AnimatedSprite.animation = '%s_%s' % [action, _direction]
	if action == 'still':
		$AnimatedSprite.speed_scale = 1
	else:
		$AnimatedSprite.speed_scale = velocity.length() / max_speed

func check_direction():
	if velocity == Vector2.ZERO:
		return
	
	if abs(velocity.x) >= abs(velocity.y):
		if velocity.x > 0:
			direction = 'right'
		elif velocity.x < 0:
			direction = 'left'
	else:
		if velocity.y > 0:
			direction = 'down'
		elif velocity.y < 0:
			direction = 'up'
		
func collect(item: ItemData):
	print('Collecting %s' % item.name)
	HUD.add_item(item)
