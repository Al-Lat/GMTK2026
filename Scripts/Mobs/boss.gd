extends Mob

@onready var attack = $Attack_Ball_Collision
@onready var animation = $Boss_Anims
@onready var animation_player = $AttackAnimationPlayer

var speed = 300.0
const JUMP_VELOCITY = -400.0

var player : Node2D = null

var facing_direction = 1
var is_allowed_attack = true
var range_to_attack = 200

func _init():
	var life = 1600

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player != null && player.global_position.distance_to(self.global_position) < range_to_attack:
		self.summon_ball()
	elif player:
		speed = 450
		chase()
	else:
		speed = 250
		#roaming()
	move_and_slide()
	if velocity.x * facing_direction > 0:
		scale.x = abs(scale.x)
	elif velocity.x * facing_direction < 0:
		#print("CG : changement direction")
		scale.x = -abs(scale.x)
		facing_direction *= -1

#func roaming() -> void:
	#if patrol_points.size() > 0 :
		#var target = patrol_points[current_point_index].position
		#velocity = (target - position).normalized() * speed
		#if not is_on_floor():
			#velocity.y = 1000
		#else:
			#velocity.y = 0
		#if position.distance_to(target) < 65:
			#current_point_index += 1
			##scale.x *=-1
			#if current_point_index >= patrol_points.size():
				#current_point_index = 0

func chase() -> void:
	velocity = (player.global_position - global_position).normalized() * speed
	if not is_on_floor():
		velocity.y = 1000
	else:
		velocity.y = 0

func on_player_detected(body: Node2D) -> void:
	if body.name == "Player" : 
		player = body

func on_player_lost(body: Node2D) -> void:
	if body.name == "Player":
		player = null


func summon_ball():
	if is_allowed_attack:
		is_allowed_attack = false
		
		
		self.attack.execute()

func taking_damage(raw_damage:float):
	if not self.anims.animation == "taking_damage" :
		self.anims.play("taking_damage")
	print("Boss : taking damage -> before : ",self.life," after : ",(self.life - raw_damage))
	self.life -= raw_damage
	if self.life <= 0:
		print("Boss : death called")
		self.death()

func death():
	self.animation.play("dead")




func _animation_finished() -> void:
	if animation.animation == "dead":
		queue_free()
