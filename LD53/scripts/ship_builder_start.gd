extends Button


func _on_Start_pressed():
	var ship = get_tree().root.get_node("ShipBuilder/RootBox")
	ship.get_parent().remove_child(ship)
	get_tree().root.add_child(ship)
	GameManager.ship = ship
	get_tree().change_scene("res://scenes/Main.tscn")
