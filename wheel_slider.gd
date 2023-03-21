extends HBoxContainer

var wheel: Node

func init(_wheel: Node):
	wheel = _wheel
	$ID.text = wheel.name
	$Indicator.min_value = -wheel.max_velocity
	$Indicator.max_value = wheel.max_velocity


func _process(delta):
	if wheel.velocity != $Indicator.value:
		display_velocity()

func _gui_input(event):
	wheel.velocity = $Indicator.value

func display_velocity():
	$Indicator.value = wheel.velocity
	$RPM.text = "RPM: %.1f" % (9.5492968 * wheel.velocity)


func _on_plus_button_down():
	wheel.acceleration = 0.1 # Replace with function body.

func _on_minus_button_down():
	wheel.acceleration = -0.1 
	
func _on_minus_button_up():
	wheel.acceleration = 0 # Replace with function body.

func _on_plus_button_up():
	wheel.acceleration = 0 # Replace with function body.
