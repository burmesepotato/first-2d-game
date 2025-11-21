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
	
# Gives Player a few second, then actually starts the game
func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_score_timer_timeout() -> void:
	score += 1
	
func _on_mob_timer_timeout() -> void:
	# Creates a mob
	var mob = mob_scene.instantiate()
	
	# MobPath is Path2D node. MobSpawnLocation is PathFollow2D node.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	
	# Choose a random location on the path to spawn mob
	mob_spawn_location.progress_ratio = randf()
	mob.position = mob_spawn_location.position
	
