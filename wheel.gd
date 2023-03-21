extends Node3D

const inertia: float = 1.0 # kg * m^2
const max_velocity: float = 40.0 # rad/s

@export var velocity: float = 0.0 # rad / s
@export var acceleration: float = 0.0 # rad / s^2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity += acceleration;
	if abs(velocity) > max_velocity:
		velocity = clamp(velocity, -max_velocity, max_velocity)
		acceleration = 0
	animate(delta)


func animate(delta):
	rotate_object_local(Vector3(0, 0, 1), velocity * delta)

func get_momentum() -> Vector3:
	return velocity * inertia * get_global_transform().basis.z;

	
func rpm() -> float:
	return 9.5492968 * velocity
