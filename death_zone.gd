extends Area2D
@onready var birb: Node2D = %birb
@onready var game_over: Label = %GameOver
@onready var try_again_button: Button = %TryAgainButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func gameOver():
	birb.get_node("CharacterBody2D").game_over()


func _on_body_entered(body: Node2D) -> void:
	birb.game_over()
	game_over.show()
	try_again_button.show()
	try_again_button.disabled = false
