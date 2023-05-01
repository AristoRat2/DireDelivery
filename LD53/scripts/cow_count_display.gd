extends RichTextLabel


func _ready():
	bbcode_text = "[center]You succesfully delivered " + str(CowTracker.cows) + " cows to Bovinae"

