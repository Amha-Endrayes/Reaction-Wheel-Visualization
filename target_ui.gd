extends HBoxContainer

@export var physics: Node3D

func _on_set_button_pressed():
	physics.global_target = Vector3($X.value, $Y.value, $Z.value).normalized()
	update_display()

func _on_randomize_pressed():
	physics.global_target.x = randf_range(-1, 1)
	physics.global_target.y = randf_range(-1, 1)
	physics.global_target.z = randf_range(-1, 1)
	physics.global_target = physics.global_target.normalized()
	update_display()

func update_display():
	$X.value = physics.global_target.x
	$Y.value = physics.global_target.y
	$Z.value = physics.global_target.z
