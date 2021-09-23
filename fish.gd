extends RigidBody2D


const move_duration = 5.0
const acc = 3.0
const max_speed = 80.0

var time = 0.0
var direction = Vector2.RIGHT


# Physics process = fixed rate
func _physics_process(delta):
	# Delta = time since last frame
	time += delta
	if time < move_duration:
		# Weird dot product stuff; ask me about it if you need
		if linear_velocity.dot(direction) < max_speed:
			# Impulse = force for one frame
			apply_central_impulse(direction * acc)
	else:
		randomize_dir()
	
	# Scale sprite
	if abs(linear_velocity.x) > 0:
		$Sprite.scale.x = -sign(linear_velocity.x) * abs($Sprite.scale.x)

# Integrate forces = when engine actually does physics calculations
func _integrate_forces(state):
	if state.get_contact_count() >= 1:
		direction = state.get_contact_local_normal(0)

func randomize_dir():
	# Get random direction using trig
	var angle = rand_range(0, TAU)
	direction = Vector2(sin(angle), cos(angle))
	time = 0
