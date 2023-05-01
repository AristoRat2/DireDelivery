extends Area2D


export(bool) var player_team
var debris_type
var hull
var cow
var turret
var player
var game_manager
var already_touched = false


func _ready():
	hull = load("res://scenes/blocks/Hull.tscn")
	cow = load("res://scenes/blocks/Cow.tscn")
	turret = load("res://scenes/blocks/Turret.tscn")
	player = get_tree().root.get_node("Main/Player")
	debris_type = get_parent().debris_type
	game_manager = get_tree().root.get_node("Main")


func _on_Area2D_area_entered(area : Area2D):
	print("touch")
	
	if area.has_node("Health") and already_touched == false:
		already_touched = true
		var health = area.get_node("Health")
		if health.player_team == player_team:
			var dir = (global_position - area.global_position).normalized()
			print("old dir " + str(dir))
			if abs(dir.x) > abs(dir.y):
				if dir.x < 0:
					dir.x = -1
				else:
					dir.x = 1
				
				dir.y = 0
			else:
				if dir.y < 0:
					dir.y = -1
				else:
					dir.y = 1
				
				dir.x = 0
			
			var grid_position = game_manager.grid[area.get_parent()] + dir
			var box_position = grid_position * game_manager.cell_size
			
			var new_box : Node2D
			
			if debris_type == "hull":
				new_box = hull.instance()
			elif debris_type == "cow":
				CowTracker.cows += 1
				new_box = cow.instance()
			elif debris_type == "turret":
				new_box = turret.instance()
			else:
				return
			
			new_box.position = box_position
			
			player.add_child(new_box)
			game_manager.grid[new_box] = grid_position
			
			get_parent().queue_free()
