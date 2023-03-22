extends HBoxContainer
# UI for representing a single reaction wheel

# The reaction wheel to represent
var wheel: Node3D

func init(_wheel: Node):
	wheel = _wheel
	$ID.text = wheel.name
	$Indicator.min_value = -wheel.max_speed
	$Indicator.max_value = wheel.max_speed
	display_velocity()


func _process(_delta):
	if wheel.speed != $Indicator.value:
		display_velocity()

func _gui_input(_event):
	wheel.speed = $Indicator.value

func display_velocity():
	$Indicator.value = wheel.speed
	$RPM.text = "RPM: %.1f" % (9.5492968 * wheel.speed)


func _on_plus_button_down():
	wheel.apply_torque(wheel.max_torque)

func _on_minus_button_down():
	wheel.apply_torque(-wheel.max_torque)
	
func _on_minus_button_up():
	wheel.acceleration = 0 # Replace with function body.

func _on_plus_button_up():
	wheel.acceleration = 0 # Replace with function body.

func _on_disable_toggled(button_pressed):
	wheel.enabled = button_pressed
