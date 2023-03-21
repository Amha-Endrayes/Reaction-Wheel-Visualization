extends Node3D

@export var axis: Vector3
const angle: float = deg_to_rad(32)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animate()


func animate():
	rotate_object_local(Vector3(0, 0, 1), 0.05)
