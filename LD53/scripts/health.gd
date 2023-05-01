extends Node


signal has_died
export(bool) var player_team
export(int) var max_health = 1
var health : int = max_health


func _ready():
	$HealthLabel.text = str(health)


func take_damage(damage):
	health = clamp(health - damage, 0, INF)
	$HealthLabel.text = str(health)
	print(str(self) + " took " + str(damage) + " damage!")
	_check_if_dead()


func _check_if_dead():
	if health == 0:
		emit_signal("has_died")
