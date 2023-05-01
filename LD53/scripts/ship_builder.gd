extends Node2D


export(PackedScene) var hull
export(PackedScene) var cow
export(PackedScene) var turret
var cell_size = 64


func _ready():
	GameManager.grid[Vector2(0, 0)] = get_node("RootBox")


func _process(delta):
	if Input.is_action_just_pressed("click"):
		var box_position : Vector2 = get_global_mouse_position()
		var grid_position = Vector2(round(box_position.x / cell_size), round(box_position.y / cell_size))
		box_position = grid_position * cell_size
		
		if GameManager.grid.has(grid_position):
			print("Box already exists there")
		else:
			if _is_attached(grid_position):
				var new_box : Node2D
				
				if GameManager.selected_block == 0:
					new_box = hull.instance()
				elif GameManager.selected_block == 1:
					new_box = cow.instance()
				elif GameManager.selected_block == 2:
					new_box = turret.instance()
				else:
					return
				
				new_box.global_position = box_position
				get_tree().root.get_node("ShipBuilder/RootBox").add_child(new_box)
				GameManager.grid[grid_position] = new_box


func _is_attached(grid_position) -> bool:
	var directions = [Vector2.UP, Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT]
	
	for dir in directions:
		if GameManager.grid.has(grid_position + dir):
			return true
	
	return false
