extends HBoxContainer

@export var cubesat: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	update()

func update():
	cubesat.net_momentum.x = $X.value
	cubesat.net_momentum.y = $Y.value
	cubesat.net_momentum.z = $Z.value


func _on_randomize_pressed():
	$X.value = randf_range($X.min_value, $X.max_value)
	$Y.value = randf_range($Y.min_value, $Y.max_value)
	$Z.value = randf_range($Z.min_value, $Z.max_value)
	update()
