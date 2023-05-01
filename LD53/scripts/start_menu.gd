extends Control


func _on_Button_pressed():
	$Main.visible = false
	$AnimationPlayer.play("ScrollIn")


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")
