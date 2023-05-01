extends RigidBody2D


var small_ast
var parent


func _ready():
	small_ast = load("res://scenes/SmallAsteroid.tscn")
	parent = get_parent()


func _on_Health_has_died():
	var new_ast : Node2D = small_ast.instance()
	parent.add_child(new_ast)
	new_ast.global_position = global_position
	
	call_deferred("queue_free")
