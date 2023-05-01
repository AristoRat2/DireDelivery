extends Area2D


export(bool) var player_team


func _on_Area2D_area_entered(area : Area2D):
	print(area)
	
	if area.has_node("Health"):
		var health = area.get_node("Health")
		if health.player_team != player_team:
			health.take_damage(1)
			get_parent().queue_free()
