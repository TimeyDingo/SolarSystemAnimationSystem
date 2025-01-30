extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Get the input direction from the UI keys
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Check for left movement (UI Left key is pressed)
	if input_dir.x < 0:
		# Handle left movement here (e.g. trigger blend shape change or signal)
		self.set("blend_shapes/Left Thruster", randf_range(0,1))
		print("Left movement detected")
		
	# Check for right movement (UI Right key is pressed)
	else:
		self.set("blend_shapes/Left Thruster", 0)
	if input_dir.x > 0:
		# Handle right movement here
		print("Right movement detected")
		self.set("blend_shapes/Right Thruster", randf_range(0,1))
	else:
		self.set("blend_shapes/Right Thruster", 0)
	if input_dir.y > 0:
		# Handle forward movement here
		print("Forward movement detected")
		self.set("blend_shapes/Bottom", randf_range(0,1))
	else:
		self.set("blend_shapes/Bottom", 0)
	if input_dir.y < 0:
		# Handle backward movement here
		print("Backward movement detected")
		self.set("blend_shapes/Top", randf_range(0,1))
	else:
		self.set("blend_shapes/Top", 0)
