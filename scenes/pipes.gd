extends Node2D
var MOVE_SPEED = 30 
#@onready var game_manager: Node = $GameManager



func _process(delta: float) -> void:
	if $Area2D.position.x < -6000:
		queue_free()
	$Area2D.position.x -= MOVE_SPEED

func _ready() -> void:
	pass
	#game_manager = %GameManager

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	print("1 score! ")
	#game_manager.add_score()
	get_tree().call_group("GameManager", "add_score")


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "birdBody":
		get_tree().call_group("GameManager", "game_over")
