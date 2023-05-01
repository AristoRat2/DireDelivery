extends Node2D


var speed = 25


func _process(delta):
	translate(Vector2(-delta * speed, 0))
	if global_position.x < -1920:
		global_position.x = 0
