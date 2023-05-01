extends Timer


func _on_DestroyParent_timeout():
	get_parent().queue_free()
