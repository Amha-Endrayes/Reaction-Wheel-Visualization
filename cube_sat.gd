extends Node3D

var net_momentum = Vector3(0, 0, 0)
var body_velocity = Vector3.ZERO
const inertia: float = 6.0


func get_wheel_momentum():
	var momentum: Vector3 = Vector3.ZERO
	for wheel in get_tree().get_nodes_in_group("wheel"):
		momentum += wheel.get_momentum()
	return momentum


var count = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var body_momentum = net_momentum - get_wheel_momentum()
	body_velocity = body_momentum / inertia
	if not body_velocity.is_zero_approx():
		rotate(body_velocity.normalized(), delta * body_velocity.length())
	
	count += delta
	if count > 0.1:
		DebugDraw.draw_vector(global_position, body_velocity * 0.5, Color.GREEN)
		count = 0
		#DebugDraw.draw_vector(global_position, get_wheel_momentum() * 0.5, Color.PINK)
