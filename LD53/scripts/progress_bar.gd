extends ProgressBar


var game_manager


func _ready():
	game_manager = get_tree().root.get_node("Main")
	$ProgressTimer.wait_time = game_manager.time / 100


func _on_ProgressTimer_timeout():
	game_manager.progress = clamp(game_manager.progress + 0.01, 0, 1)
	value = game_manager.progress * 100
