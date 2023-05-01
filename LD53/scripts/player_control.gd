extends KinematicBody2D


signal fire_turrets
var speed = 200
var game_manager


func _ready():
	game_manager = get_tree().root.get_node("Main")
	game_manager.grid[get_node("Hull")] = Vector2.ZERO


func _process(delta):
	if get_child_count() == 0:
		get_tree().change_scene("res://scenes/GameOver.tscn")


func _physics_process(delta):
	if game_manager.progress > 0:
		var _move_input = _get_move_input()
		move_and_slide(_move_input * speed)


func _get_move_input() -> Vector2:
	var _input = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		_input += Vector2(0, -1)
	if Input.is_action_pressed("move_down"):
		_input += Vector2(0, 1)

	return _input.normalized()
