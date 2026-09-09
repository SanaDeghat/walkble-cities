extends RigidBody2D

@onready var foot_1: Sprite2D = $foot1
@onready var foot_2: Sprite2D = $foot2

var spin_speed := 125.0
var spin_dir := -1
var pivot_foot: Sprite2D
var current_pivot_foot_position

func _ready() -> void:
	pivot_foot = foot_1
	set_active_foot(foot_1)
	
	pivot_foot.global_position=current_pivot_foot_position


func _process(delta: float) -> void:
	angular_velocity = deg_to_rad(spin_speed) * spin_dir
	if abs(pivot_foot.global_position.distance_to(current_pivot_foot_position)) > 2:
		current_pivot_foot_position=pivot_foot.global_position
		spin_dir*=-1
	if Input.is_action_just_pressed("ui_accept"):
		if pivot_foot == foot_1:
			set_active_foot(foot_2)
		else:
			set_active_foot(foot_1)


func set_active_foot(foot: Sprite2D) -> void:
	pivot_foot = foot
	current_pivot_foot_position=(pivot_foot.global_position)
	center_of_mass = to_local(pivot_foot.global_position)
