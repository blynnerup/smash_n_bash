extends Node

@onready var score_label = $ScoreLabel

var score = 0
var daggers = 0

func add_point():
	score += 1
	score_label.text = "Collected " + str(score) + " coins."
	
func add_daggers():
	daggers = 3
	print(daggers)

func remove_dagger():
	daggers -= 1
