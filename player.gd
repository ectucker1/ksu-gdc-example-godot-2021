extends RigidBody2D


const acc = 3.0


# Physics process = fixed rate
func _physics_process(delta):
	# Get input direction
	var input_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var input_y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	# Impulse = force for one frame
	apply_central_impulse(Vector2(input_x, input_y) * acc)
	
	# Set sprite if spinning fast enough
	if abs(angular_velocity) > 10:
		$Sprite.frame = 10
	else:
		$Sprite.frame = 0
	
	# Flip sprite off of directions
	if abs(linear_velocity.x) > 0:
		$Sprite.scale.x = -sign(linear_velocity.x)
