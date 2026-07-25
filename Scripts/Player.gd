class_name Player extends CharacterBody2D

var player_singleton = PlayerSingleton

@export var gravity:float = 1000.0
@export var speed:float = 500.0
@export var jump_force:float = 800.0

@export var acceleration:float = 0.2

var facing_direction:int = 1  # 1 = droite, -1 = gauche
var direction_to_mouse: Vector2 = Vector2.ZERO
var start_point:Marker2D

const SPECIAL_ATTACK_OFFSET = 300.0
const RANGED_ATTACK_OFFSET = 110
const MELEE_ATTACK_OFFSET = 40.0

@onready var animated_sprite = $playerAnimation
@onready var ranged_cooldown = $ranged_cooldown
@onready var attack_manager:PlayerAttackManager = $attack_manager
var is_animation_melee_sprite_offset:bool = false


func _ready() -> void:
	player_singleton.player = self
	start_point = get_node("../start")
	self.global_position = start_point.global_position
	
	animated_sprite.play("idle")
	print("Player :",self)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y = clamp(velocity.y + gravity * delta, -800, 1000)

	var direction_movment = Input.get_axis("player_move_left", "player_move_right")
	
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = -jump_force
		
	velocity.x = lerp(velocity.x, direction_movment * speed, acceleration)
	update_animations(direction_movment)
	move_and_slide()

func _process(delta: float) -> void:
	var raw = get_global_mouse_position() - global_position
	if raw.length() > 0:
		self.direction_to_mouse = raw.normalized()
	attack_manager.process_attacks(delta)


func update_animations(direction_movment):

	if is_on_floor():
		if direction_movment == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
	#decalage du sprite pour animation melee
	if animated_sprite.animation == "attack_slash" && !is_animation_melee_sprite_offset:
		animated_sprite.position.x = 16 * facing_direction
		is_animation_melee_sprite_offset = true
	#sinon reset du decalage du sprite
	elif animated_sprite.animation != "attack_slash" && is_animation_melee_sprite_offset:
		#print("xpos : ",animated_sprite.position.x)
		animated_sprite.position.x = 0
		is_animation_melee_sprite_offset = false
		
	if (facing_direction != sign(direction_to_mouse.x)):
		facing_direction = sign(direction_to_mouse.x)
		animated_sprite.flip_h = (facing_direction == -1)
		
		#inverser le décalage du sprite pour animation melee
		if animated_sprite.animation == "attack_slash" && is_animation_melee_sprite_offset:
			animated_sprite.position.x *= -1


func _on_death_zone_body_entered(body: Node2D) -> void:
	if (body == self):
		self.global_position = start_point.global_position

func mort():
	animated_sprite.play("dead")
