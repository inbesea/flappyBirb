extends Node
var score = 0
@onready var score_label: Label = %ScoreLabel

func add_score():
	score += 1
	print(score)
	score_label.text = "" + str(score) + ""

func _ready() -> void:
	add_to_group("GameManager")

func game_over():
	%birb.game_over()
	%GameOver.show()
	%TryAgainButton.show()
	%TryAgainButton.disabled = false
