extends Node2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
const gravity:Vector2 = Vector2(0,500)
var wingup = load("res://Assets/unitytut-birdwingup.png")
var wingdown = load("res://Assets/unitytut-birdwingdown.png")
var alive = true
@onready var bird_body: CharacterBody2D = %birdBody


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not bird_body.is_on_floor():
		bird_body.velocity += (bird_body.get_gravity() + gravity) * delta
		
	if !alive:
		bird_body.move_and_slide()
		return
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		bird_body.velocity.y = JUMP_VELOCITY
		
	if Input.is_action_pressed("jump"):
		%birdBody.rotation_degrees -= 10
		%birdBody.rotation_degrees = clamp(%birdBody.rotation_degrees, -10, 10)
		%wings.texture = wingdown
	else:
		%birdBody.rotation_degrees += .5
		%birdBody.rotation_degrees = clamp(%birdBody.rotation_degrees, -10, 10)
		%wings.texture = wingup

	bird_body.move_and_slide()

func game_over():
	alive = false
