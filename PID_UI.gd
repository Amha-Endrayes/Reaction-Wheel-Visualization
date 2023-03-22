extends HBoxContainer

@export var cubesat: Node

func _ready():
	update()



func update():
	cubesat.P = $Proportional.value
	cubesat.I = $Integral.value
	cubesat.D = $Derivative.value
	
	cubesat.pid_mode = $Enabled.button_pressed
	if not cubesat.pid_mode:
		for wheel in get_tree().get_nodes_in_group("wheel"):
			wheel.apply_torque(0)
