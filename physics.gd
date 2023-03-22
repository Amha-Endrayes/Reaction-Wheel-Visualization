extends Node3D
# The physics system that governs the CubeSat's behavior

var global_net_momentum = Vector3(0, 0, 0)
var global_body_velocity = Vector3.ZERO
var global_target = Vector3(1, 0, 0)
const inertia: float = 6.0



func _process(delta):
	var global_body_momentum = global_net_momentum - get_global_wheel_momentum()
	global_body_velocity = global_body_momentum / inertia
	if not global_body_velocity.is_zero_approx():
		rotate(global_body_velocity.normalized(), delta * global_body_velocity.length())
	
	DebugDraw.draw_vector(global_position, global_body_velocity * 0.5, Color.GREEN)
	DebugDraw.draw_vector(global_position, global_target * 2, Color.RED)

func get_global_wheel_momentum() -> Vector3:
	var global_momentum: Vector3 = Vector3.ZERO
	for wheel in get_tree().get_nodes_in_group("wheel"):
		global_momentum += wheel.get_global_direction() * wheel.get_speed()
	return global_momentum

#### SENSORS ####
# The CubeSat controller will call ONLY these functions to get
# info about its surroundings.
# TODO: Add latency and inaccuracies

func get_local_body_velocity() -> Vector3:
	return global_body_velocity * get_global_transform().basis

func get_local_target() -> Vector3:
	return global_target * get_global_transform().basis

func get_local_wheel_momentum() -> Vector3:
	return get_global_wheel_momentum() * get_global_transform().basis
