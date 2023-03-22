extends SubViewportContainer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()

func _draw():
	for vector in DebugDraw.vectors:
		vector.draw(self, %Camera)
	DebugDraw.vectors.clear()
