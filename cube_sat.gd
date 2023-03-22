extends Node
# The control and PID algorithms from the satellite's point of view

func _process(delta):
	
	pid()


func apply_torque(torque: Vector3):
	for wheel in get_tree().get_nodes_in_group("wheel"):
		wheel.acceleration = -torque.dot(wheel.get_direction())

func pid():
	apply_torque(-10.0 * $Physics.body_velocity)
	


