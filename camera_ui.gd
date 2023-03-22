extends CheckButton



func _on_toggled(button_pressed):
	%OnboardCamera.current = button_pressed
	%Camera.current = not button_pressed
	
