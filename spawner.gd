extends Node2D

var pipes_scene = load("res://scenes/pipes.tscn")
var timer = 0
var spawnRate = 1
@onready var pipes: Node = %Pipes

func _process(delta: float) -> void:
	if timer > spawnRate:
		print("test")
		spawnPipes()
		timer = 0
	timer += delta


func spawnPipes():
	var pipe = pipes_scene.instantiate()
	pipe.position.y += randi_range(-200,200)
	pipes.add_child(pipe)
