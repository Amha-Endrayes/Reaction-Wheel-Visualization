extends Control

var vectors = []

class Vector:
	var pos
	var dir
	var color: Color
	var width: float
	
	func _init(_pos, _dir, _color, _width):
		pos = _pos
		dir = _dir
		color = _color
		width = _width
		
	
	func draw(node, camera):
		var start = camera.unproject_position(pos)
		var end = camera.unproject_position(pos + dir)
		node.draw_line(start, end, color, width)
		
		var dir2D = start.direction_to(end)
		# Draw Triangle
		var a = end + dir2D * width
		var b = end + dir2D.rotated(2*PI/3) * width * 4
		var c = end + dir2D.rotated(4*PI/3) * width * 4
		var points = PackedVector2Array([a, b, c])
		node.draw_polygon(points, PackedColorArray([color]))

func _process(_delta):
	queue_redraw()
	
func _draw():
	for vector in vectors:
		vector.draw(self, get_viewport().get_camera_3d())
	vectors.clear()


func draw_vector(pos: Vector3, dir: Vector3, color: Color):
	vectors.push_back(Vector.new(pos, dir, color, 2))
	
