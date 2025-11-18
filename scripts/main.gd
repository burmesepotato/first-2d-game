extends Node

@export var mob_scene: PackedScene
var score

# Receive hit() signal from Player node and name as game_over() func
func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game() -> void:
	score = 0
	$Player.start($StartPosition.position)
	$ScoreTimer.start()
	
