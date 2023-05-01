extends Control


var dialog = 0


func _ready():
	$AnimationPlayer.play("ScrollIn")
	if CowTracker.cows == 0:
		var t = $Story/Panel/RichTextLabel
		t.text = '"So no cows? Darn"'
		dialog = 3
		CowTracker.cows = 0


func next_dialog():
	var t = $Story/Panel/RichTextLabel
	
	if dialog == 0:
		t.text = '"Galaxy savings cows? You bet they are, we are having the ultimate barbeque here."'
	elif dialog == 1:
		t.text = '"All lives lost on the ship that was supposed to give us the cows? Mega bummer bro. I will dedicate the first t-bone for those who can only party with us in spirit."'
	elif dialog == 2:
		t.text = '"Anyways got to go aha. These cows are not gonna barbeque themselves."'
	elif dialog == 3:
		$AnimationPlayer.play("ScrollOut")
	
	dialog += 1


func load_menu():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
