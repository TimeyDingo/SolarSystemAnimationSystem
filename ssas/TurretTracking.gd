extends CharacterBody3D

@export var base_rotation_speed := 1.5  # Rotation speed for Base
@export var turret_rotation_speed := 1.2  # Rotation speed for Turret
@export var target: Node3D  # Assign the target in the editor

@onready var base = $CollisionShape3D/Base  # Get the Base node
@onready var turret_head = $CollisionShape3D/Base/TurretHead  # Get the Turret Head node

func _process(delta):
	if target:
		track_target(delta)

func track_target(delta):
	var base_position = base.global_transform.origin
	var turret_position = turret_head.global_transform.origin
	var target_position = target.global_transform.origin

	# Base Rotation (Horizontal)
	var base_target_direction = (target_position - base_position).normalized()
	var base_target_rotation = atan2(base_target_direction.x, base_target_direction.z)
	var base_current_rotation = base.rotation.z
	base.rotation.z = lerp_angle(base_current_rotation, base_target_rotation, base_rotation_speed * delta)

	# Turret Head Rotation (Vertical)
	var turret_target_direction = (target_position - turret_position).normalized()
	var turret_target_rotation = -asin(turret_target_direction.y)  # Negative to match Godot's coordinate system
	var turret_current_rotation = turret_head.rotation.x
	turret_head.rotation.x = lerp_angle(turret_current_rotation, turret_target_rotation, turret_rotation_speed * delta)
