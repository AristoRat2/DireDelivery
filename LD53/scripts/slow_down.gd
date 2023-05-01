extends RigidBody2D


# Conservation of momentum is cringe
# TODO: slows more one direction than the other, not normalized


var slow_rate : float = 50


func _physics_process(delta):
	if linear_velocity.x < 0:
		linear_velocity.x += delta * slow_rate
	elif linear_velocity.x > 0:
		linear_velocity.x -= delta * slow_rate
		
	if linear_velocity.y < 0:
		linear_velocity.y += delta * slow_rate
	elif linear_velocity.y > 0:
		linear_velocity.y -= delta * slow_rate

	if linear_velocity.length() < 1:
		linear_velocity = Vector2.ZERO
