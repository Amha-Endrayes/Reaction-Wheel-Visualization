extends Node
# The control and PID algorithms from the satellite's point of view

const FRONT = Vector3(0, 1, 0)

var P: float = 10
var I: float = 0
var D: float = 10

var pid_mode: bool = false

var angle_to_target = 0

func _process(_delta):
	angle_to_target = $Physics.get_local_target().angle_to(FRONT)
	if pid_mode:
		pid()


func apply_torque(torque: Vector3):
	var curr_momentum = get_wheel_momentum()
	for wheel in get_tree().get_nodes_in_group("wheel"):
		
		wheel.apply_torque(-torque.dot(wheel.get_local_direction()))

func pid():
	var target = $Physics.get_local_target()
	var proportional = P * FRONT.cross(target).normalized() * angle_to_target
	var derivative= -D * $Physics.get_local_body_velocity()
	
	apply_torque(proportional + derivative)
	
	

func get_wheel_momentum() -> Vector3:
	var local_momentum = Vector3.ZERO
	for wheel in get_tree().get_nodes_in_group("wheel"):
		local_momentum += wheel.get_local_direction() * wheel.get_speed()
	return local_momentum
