extends CharacterBody2D

@export var patrol_points: Array[Marker2D] = []
@onready var detection_area: Area2D = $detection_area

var current_point_index = 0
var player : Node2D = null
var speed = 250.0
var orientation = 1
var tourner_gauche = false
var tourner_droit = true
var ancienne_pos_x = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if patrol_points.size() == 0:
		print("No patrol points assigned")
	
	detection_area.body_entered.connect(on_player_detected)
	detection_area.body_exited.connect(on_player_lost)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		speed = 550
		chase()
	else:	
		speed = 250
		roaming()
	move_and_slide()
	if velocity.x * orientation > 0:
		scale.x = abs(scale.x)
	elif velocity.x * orientation < 0:
		scale.x = -abs(scale.x)
		orientation *= -1

func roaming() -> void:
	if patrol_points.size() > 0 :
		var target = patrol_points[current_point_index].position
		velocity = (target - position).normalized() * speed
		if position.distance_to(target) < 65:
			current_point_index += 1
			#scale.x *=-1
			if current_point_index >= patrol_points.size():
				current_point_index = 0
			print(current_point_index)	

func chase() -> void:
	velocity = (player.global_position - global_position).normalized() * speed

func on_player_detected(body: Node2D) -> void:
	if body.name == "Player" : 
		player = body
		print("Objectif : suivre ", body.name)

func on_player_lost(body: Node2D) -> void:
	if body.name == "Player":
		player = null
		print ("Perte de détection")
