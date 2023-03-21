extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func get_wheel_momentum():
	var momentum: Vector3 = Vector3.ZERO
	for wheel in get_tree().get_nodes_in_group("wheel"):
		momentum += wheel.get_momentum()
	return momentum
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(Vector3(0, 0, 1), -1.0 * delta)
	
	DebugDraw.draw_vector(global_position, get_wheel_momentum() * 0.5)


