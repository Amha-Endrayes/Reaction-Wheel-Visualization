extends Label

@export var cubesat: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Error: %.1f°" % rad_to_deg(cubesat.angle_to_target)
