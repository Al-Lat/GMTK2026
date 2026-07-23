extends CharacterBody2D

@onready var anim_running_2d : AnimatedSprite2D = $AnimatedSprite2D
@export var patrol_points: Array[Marker2D] = []
#Area of the chrono-guard detection
@onready var area_2d: Area2D = $Area2D


var current_point_index = 0
var player : Node2D = null
var speed = 350.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if patrol_points.size() == 0:
		print("No patrol points assigned")
		
	area_2d.body_entered.connect(_on_player_detected)
	area_2d.body_exited.connect(_on_player_lost)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	roaming()
	move_and_slide()
	
func roaming() -> void:
	if patrol_points.size() > 0 :
		var target = patrol_points[current_point_index].position
		velocity = (target - position).normalized() * speed
		
		if position.distance_to(target) <20.0:
			print("i'm in")
			current_point_index += 1
			if current_point_index >= patrol_points.size():
				current_point_index = 0

#func _on_timer_timeout() -> void:
#	direction *= -1
#	anim_running_2d.flip_h = !anim_running_2d.flip_h


func _on_player_detected(body: Node2D) -> void:
	if body.name == "Player" :
		player = body

func _on_player_lost(body : Node2D) -> void:
	if body.name == "Player" :
		player = null
