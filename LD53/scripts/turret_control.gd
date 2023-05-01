extends "res://scripts/building_block.gd"


var speed = 500
var projectile
var new_parent


func _ready():
	get_parent().connect("fire_turrets", self, "_fire")
	projectile = load("res://scenes/Projectile.tscn")
	new_parent = get_tree().root


func _fire():
	print("firing")
	var _new_pro = projectile.instance()
	_new_pro.global_position = global_position
	var _dir = (get_global_mouse_position() - global_position).normalized()
	_new_pro.linear_velocity = _dir * speed
	new_parent.add_child(_new_pro)
	_new_pro.look_at(get_global_mouse_position())
