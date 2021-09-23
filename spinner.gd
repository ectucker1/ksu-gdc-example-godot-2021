extends RigidBody2D


const speed = 200.0


# Integrate forces = when engine does physics calculations
func _integrate_forces(state):
	# You can only set these in _integrate_forces,
	# otherwise physics math will override them
	state.linear_velocity = Vector2.ZERO
	state.angular_velocity = speed
