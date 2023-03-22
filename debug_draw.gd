extends Node

var vectors = []

class Vector:
	const WIDTH: float = 2
	var pos
	var dir
	var color: Color
	
	func _init(_pos, _dir, _color):
		pos = _pos
		dir = _dir
		color = _color
			
	func draw(node, camera):
		var start = camera.unproject_position(pos)
		var end = camera.unproject_position(pos + dir)
		node.draw_line(start, end, color, WIDTH)
		
		var dir2D = start.direction_to(end)
		# Draw Triangle
		var a = end + dir2D * WIDTH
		var b = end + dir2D.rotated(2*PI/3) * WIDTH * 4
		var c = end + dir2D.rotated(4*PI/3) * WIDTH * 4
		var points = PackedVector2Array([a, b, c])
		node.draw_polygon(points, PackedColorArray([color]))

func draw_vector(start: Vector3, direction: Vector3, color: Color):
	vectors.push_back(Vector.new(start, direction, color))
	
