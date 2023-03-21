extends WorldEnvironment


func _input(event):
	
	# Camera Control      
	if event is InputEventMouseMotion and Input.is_action_pressed("Right Click"):
		$CameraPivot.rotation.y -= event.relative.x*0.01
		$CameraPivot.rotation.x -= event.relative.y*0.01
		$CameraPivot.rotation.x = clamp($CameraPivot.rotation.x, -PI/2, PI/2)
