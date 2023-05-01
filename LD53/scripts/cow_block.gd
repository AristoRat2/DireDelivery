extends Node2D


var sound


func _ready():
	$BuildingBlock/Health.connect("has_died", self, "_on_death")
	sound = load("res://scenes/HullBreakSound.tscn")


func _on_death():
	CowTracker.cows -= 1
	var s = sound.instance()
	s.global_position = global_position
	get_tree().root.get_node("Main").add_child(s)
	queue_free()
