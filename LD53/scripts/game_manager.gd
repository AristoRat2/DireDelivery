extends Node2D


var ship : Node2D
var progress : float
var selected_block : int
var game_running = false
var time : float = 120
var slowest_spawn_rate : float = 1
var fastest_spawn_rate : float = 0.25
var grid = {}
var cell_size = 64


func _process(delta):
	if progress == 1:
		get_tree().change_scene("res://scenes/End.tscn")
