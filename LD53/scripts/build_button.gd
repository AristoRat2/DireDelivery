extends Button


export(int) var id


func _ready():
	connect("toggled", self, "_on_Button_toggled")


func _on_Button_toggled(button_pressed):
	if button_pressed == true:
		GameManager.selected_block = id
		
		var parent = get_parent()
		for child in parent.get_children():
			if child != self:
				child.pressed = false
	else:
		var parent = get_parent()
		for child in parent.get_children():
			if child.pressed == true:
				return
		
		GameManager.selected_block = -1
