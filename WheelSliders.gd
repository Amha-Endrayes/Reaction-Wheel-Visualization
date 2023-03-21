extends VBoxContainer

@export var wheel_slider: PackedScene
@export var wheels: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	for wheel in wheels.get_children():
		var slider = wheel_slider.instantiate()
		slider.init(wheel)
		add_child(slider)
