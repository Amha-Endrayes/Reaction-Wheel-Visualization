extends HBoxContainer
# UI for representing a single reaction wheel

# The reaction wheel to represent
var wheel: Node3D

func init(_wheel: Node):
	wheel = _wheel
	$ID.text = wheel.name
	$Indicator.min_value = -wheel.max_velocity
	$Indicator.max_value = wheel.max_velocity
	display_velocity()


func _process(delta):
	if wheel.velocity != $Indicator.value:
		display_velocity()

func _gui_input(event):
	wheel.velocity = $Indicator.value

func display_velocity():
	$Indicator.value = wheel.velocity
	$RPM.text = "RPM: %.1f" % (9.5492968 * wheel.velocity)


func _on_plus_button_down():
	wheel.acceleration = wheel.max_torque  /wheel.inertia

func _on_minus_button_down():
	wheel.acceleration = -wheel.max_torque / wheel.inertia
	
func _on_minus_button_up():
	wheel.acceleration = 0 # Replace with function body.

func _on_plus_button_up():
	wheel.acceleration = 0 # Replace with function body.

func _on_disable_toggled(button_pressed):
	wheel.enabled = button_pressed
