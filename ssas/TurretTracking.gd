extends CharacterBody3D

@export var base_rotation_speed := 1.5  # Rotation speed for Base
@export var turret_rotation_speed := 1.2  # Rotation speed for Turret

@onready var base = $CollisionShape3D/Base  # Get the Base node
@onready var turret_head = $CollisionShape3D/Base/TurretHead  # Get the Turret Head node

func _process(delta):
	# Rotate Base (Left/Right)
	if Input.is_action_pressed("ui_left"):
		base.rotate_z(delta * base_rotation_speed)
	elif Input.is_action_pressed("ui_right"):
		base.rotate_z(-delta * base_rotation_speed)

	# Rotate Turret Head (Up/Down)
	if Input.is_action_pressed("ui_up"):
		turret_head.rotate_x(-delta * turret_rotation_speed)  # Negative for upward
	elif Input.is_action_pressed("ui_down"):
		turret_head.rotate_x(delta * turret_rotation_speed)  # Positive for downward
