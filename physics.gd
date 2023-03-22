extends Node3D
# The physics system that governs the CubeSat's behavior


var net_momentum = Vector3(0, 0, 0)
var body_velocity = Vector3.ZERO
const inertia: float = 6.0

@onready var physics: Node = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var body_momentum = net_momentum - get_wheel_momentum()
	body_velocity = body_momentum / inertia
	if not body_velocity.is_zero_approx():
		rotate(body_velocity.normalized(), delta * body_velocity.length())
	
	DebugDraw.draw_vector(global_position, body_velocity * 0.5, Color.GREEN)

func get_wheel_momentum():
	var momentum: Vector3 = Vector3.ZERO
	for wheel in get_tree().get_nodes_in_group("wheel"):
		momentum += wheel.get_momentum()
	return momentum
