extends Node2D


export(PackedScene) var small_asteroid
export(PackedScene) var large_asteroid
export(PackedScene) var hull_debris
export(PackedScene) var cow_debris
export(PackedScene) var planet
var large_chance = 3
var hull_chance = 3
var cow_chance = 3
var game_manager
var planet_spawned = false


func _ready():
	game_manager = get_tree().root.get_node("Main")


func _physics_process(delta):
	$SpawnTimer.wait_time = lerp(game_manager.slowest_spawn_rate, game_manager.fastest_spawn_rate, game_manager.progress)
	if game_manager.progress > 0.9 and planet_spawned == false:
		planet_spawned = true
		$AnimationPlayer.play("MovePlanet")
		


func _on_Timer_timeout():
	if game_manager.progress < 0.7:
		var new_ast 
		var rand = round(rand_range(0, 3))
		if rand == 0:
			new_ast = large_asteroid.instance()
			print("large")
		elif rand == 1:
			new_ast = hull_debris.instance()
			print("hull")
		elif rand == 2:
			new_ast = cow_debris.instance()
			print("cow")
		else:
			new_ast = small_asteroid.instance()
			print("small")
		
		new_ast.global_position = Vector2(global_position.x, rand_range(-400, 400))
		add_child(new_ast)
