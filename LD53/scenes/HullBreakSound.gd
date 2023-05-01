extends AudioStreamPlayer2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	time += delta
	print(time)
	if time > 1:
		queue_free()
