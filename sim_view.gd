extends SubViewportContainer
# Holds the simulation display.
# Draws all the vectors in DebugDraw
# Handles camera movement


func _process(delta):
	queue_redraw()

func _draw():
	for vector in DebugDraw.vectors:
		vector.draw(self, %Camera)
	DebugDraw.vectors.clear()

func _input(event):
	# Camera Control      
	if event is InputEventMouseMotion and Input.is_action_pressed("Right Click"):
		%CameraPivot.rotation.y -= event.relative.x*0.01
		%CameraPivot.rotation.x -= event.relative.y*0.01
		%CameraPivot.rotation.x = clamp(%CameraPivot.rotation.x, -PI/2, PI/2)
