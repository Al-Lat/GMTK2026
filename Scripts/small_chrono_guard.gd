extends CharacterBody2D

@export var patrol_points: Array[Marker2D] = []
@onready var detection_area: Area2D = $detection_area
@onready var control_timer = $control_timer
@onready var cooldown_timer = $chrono_slash_cooldown
@onready var anims = $Anims
@onready var chrono_slash = $chrono_slash
@onready var chrono_kamikaze = $chrono_kamikaze

var current_point_index = 0
var player : Node2D = null
var speed = 250.0
var orientation = 1
var tourner_gauche = false
var tourner_droit = true
var ancienne_pos_x = 0
var time = false

var is_allowed_chrono_slash = true
var range_to_attack = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if patrol_points.size() == 0:
		print("No patrol points assigned")
	
	detection_area.body_entered.connect(on_player_detected)
	detection_area.body_exited.connect(on_player_lost)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if player != null && player.global_position.distance_to(self.global_position) < range_to_attack:
		self.summon_chrono_slash()

	if player:
		speed = 350
		chase()
	else:	
		speed = 150
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
		if not is_on_floor():
			velocity.y = 1000
		else:
			velocity.y = 0
		if position.distance_to(target) < 30:
			if time :
				self.control_timer.stop()
				time = false
			current_point_index += 1
			#scale.x *=-1
			if current_point_index >= patrol_points.size():
				current_point_index = 0

func chase() -> void:
	velocity = (player.global_position - global_position).normalized() * speed
	if not is_on_floor():
		velocity.y = 1000
	else:
		velocity.y = 0

func on_player_detected(body: Node2D) -> void:
	if body.name == "Player" : 
		player = body
		if time :
			time = false
			self.control_timer.stop()

func on_player_lost(body: Node2D) -> void:
	if body.name == "Player":
		player = null
		self.control_timer.start()
		time = true

func summon_chrono_slash():
	if is_allowed_chrono_slash:
		is_allowed_chrono_slash = false
		self.anims.visible = false
		self.chrono_slash.execute()
		
		self.cooldown_timer.start()
		self.anims.visible = true

func death()->void:
	self.chrono_kamikaze.execute()
	queue_free()


func _on_timer_timeout() -> void:
	self.global_position = patrol_points[current_point_index].global_position
	time = false
	


func _on_chrono_slash_cooldown_timeout() -> void:
	self.is_allowed_chrono_slash = true
