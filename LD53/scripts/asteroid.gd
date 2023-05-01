extends RigidBody2D


func _on_Health_has_died():
	queue_free()
