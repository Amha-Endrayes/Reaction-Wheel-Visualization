extends Node3D

const inertia: float = 1.0 # kg * m^2
const max_speed: float = 40.0 # rad/s
const max_torque: float = 10.0 # N * m

@export var speed: float = 0.0 # rad / s
@export var acceleration: float = 0.0 # rad / s^2
@export var enabled: bool = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enabled:
		acceleration = clamp(acceleration, -max_torque/inertia, max_torque/inertia)
		speed += acceleration * delta;
		if abs(speed) > max_speed:
			speed = clamp(speed, -max_speed, max_speed)
			acceleration = 0
		_animate(delta)
	else:
		speed = 0

func _animate(delta):
	rotate_object_local(Vector3(0, 0, 1), speed * delta)

func get_global_direction() -> Vector3:
	return get_global_transform().basis.z

#### SENSORS ####
# The CubeSat controller will call ONLY these functions to get
# info about its surroundings.
# TODO: Add latency and inaccuracies

func apply_torque(torque: float):
	acceleration = torque/inertia

func get_local_direction() -> Vector3:
	return basis.z

func get_speed() -> float:
	return speed
