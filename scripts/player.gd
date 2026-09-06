extends RigidBody2D
@onready var foot_1: Sprite2D = $foot1
@onready var foot_2: Sprite2D = $foot2
var CurrentFoor = foot_1;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	angular_velocity=2
