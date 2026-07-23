extends CharacterBody2D

@onready var anim_running_2d : AnimatedSprite2D = $AnimatedSprite2D
@export var patrol_points: Array[Marker2D] = []
var current_point_index = 0
var player : Node2D = null
var speed = 350.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if patrol_points.size() == 0:
		print("No patrol points assigned")
		
	print(patrol_points[1].position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	roaming()
	move_and_slide()
	
func roaming() -> void:
	if patrol_points.size() > 0 :
		var target = patrol_points[current_point_index].position
		velocity = (target - position).normalized() * speed
		print(position.distance_to(target))
		if position.distance_to(target) < 65:
			current_point_index += 1
			if current_point_index >= patrol_points.size():
				current_point_index = 0
