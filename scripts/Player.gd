extends KinematicBody2D

var velocity = Vector2()

const speed = 200
const gravity = 10
const jump = 400
const game_floor = Vector2(0, -1)

func _ready():
	pass
	
func _physics_process(delta):
	
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	elif Input.is_action_pressed("right"):
		velocity.x = speed
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("up") and is_on_floor():
		velocity.y = -jump
		
	velocity.y += gravity
		
	velocity = move_and_slide(velocity, game_floor)

	position.x = clamp(position.x, 0, 1280-32);
	position.y = clamp(position.y, 0, 1280-32);
