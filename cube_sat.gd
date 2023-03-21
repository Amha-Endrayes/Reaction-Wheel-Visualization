extends Node3D

var net_momentum = Vector3(0, 0, 0)

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
	var body_momentum = net_momentum - get_wheel_momentum()
	if not body_momentum.is_zero_approx():
		rotate(body_momentum.normalized(), delta * body_momentum.length())
	
	DebugDraw.draw_vector(global_position, body_momentum * 0.5, Color.GREEN)
