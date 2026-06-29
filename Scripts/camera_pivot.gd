extends Node3D

@export var mouse_sensitivity: float = 0.005
@export var min_pitch: float = -0.5  # Look up (in degrees)
@export var max_pitch: float = 0.5   # Look down (in degrees)

@onready var spring_arm: SpringArm3D = $SpringArm3D

func _ready() -> void:
	# Locks and hides the mouse
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Horizontal rotation (Yaw)
		rotate_y(-event.relative.x * mouse_sensitivity)
		
		# Vertical rotation (Pitch)
		spring_arm.rotate_x(-event.relative.y * mouse_sensitivity)
		spring_arm.rotation.x = clamp(spring_arm.rotation.x, min_pitch, max_pitch)
