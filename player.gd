extends KinematicBody2D

const SPEED = 240
const GRAVITY = 10
const JUMP_POWER = -480
const FLOOR = Vector2(0,-1)

var velocity = Vector2()

var on_ground = false


func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	
	else:
		velocity.x = 0
		if on_ground == true:
			$AnimatedSprite.play("idle")
	
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false
	
	velocity.y += GRAVITY
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false	
		if velocity.y < 0:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("idle")

	velocity = move_and_slide(velocity,FLOOR)						
