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

var is_in_shop:bool = false
var animation_waiting_ended:bool = true
var in_air:bool = false
var is_dead:bool = false


func _ready() -> void:
	player_singleton.player = self
	start_point = get_node("../start")
	self.global_position = start_point.global_position
	
	animated_sprite.play("idle")
	print("Player :",self)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y = clamp(velocity.y + gravity * delta, -800, 1000)
	if not is_dead:
		var direction_movment = Input.get_axis("player_move_left", "player_move_right")
		
		if Input.is_action_just_pressed("player_jump") and is_on_floor():
			animated_sprite.play("jump")
			in_air = true
			animation_waiting_ended = false
			velocity.y = -jump_force
			
		velocity.x = lerp(velocity.x, direction_movment * speed, acceleration)
		update_animations(direction_movment)
	else :
		velocity.x = (velocity.x - 100) * delta
	move_and_slide()

func _process(delta: float) -> void:
	var raw = get_global_mouse_position() - global_position
	if raw.length() > 0:
		self.direction_to_mouse = raw.normalized()
	if !is_in_shop:
		attack_manager.process_attacks(delta)


func update_animations(direction_movment):
	if animation_waiting_ended:
		if is_on_floor():
			if in_air:
				in_air = false
				animation_waiting_ended = false
				animated_sprite.play("touch_ground")
			elif direction_movment == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		else:
			in_air = true
			animated_sprite.play("falling")
			
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
	animation_waiting_ended = false
	is_dead = true
	animated_sprite.play("dead")


func _on_bus_shop_dedans() -> void:
	is_in_shop = true

func _on_bus_shop_dehors() -> void:
	is_in_shop = false

func _on_player_animation_animation_looped() -> void:
	if animated_sprite.animation == "jump" || animated_sprite.animation == "touch_ground":
		animation_waiting_ended = true
	elif animated_sprite.animation == "dead":
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
