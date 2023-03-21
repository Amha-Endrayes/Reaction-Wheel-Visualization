extends Node3D

@export var rpm: float = 4.0
const inertia: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animate(delta)


func animate(delta):
	rotate_object_local(Vector3(0, 0, 1), rpm * delta)

func get_momentum() -> Vector3:
	return (0.1047198 * rpm) * inertia * to_global(basis.z);
