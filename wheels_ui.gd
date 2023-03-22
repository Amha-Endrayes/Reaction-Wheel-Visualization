extends VBoxContainer
# Holds the UI for each wheel

@export var wheel_slider: PackedScene
@export var wheels: Node

func _ready():
	for wheel in wheels.get_children():
		var slider = wheel_slider.instantiate()
		slider.init(wheel)
		add_child(slider)
