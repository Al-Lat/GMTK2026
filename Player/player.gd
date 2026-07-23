extends CharacterBody2D

@export var gravity = 340
@export var speed = 500
@export var jump_force = 220

@export var acceleration = 0.2

@export var facing_direction = 1  # 1 = droite, -1 = gauche

const MELEE_ATTACK_HITBOX = preload("res://Scenes/static_fire_attack.tscn")
const MELEE_ATTACK_OFFSET = 40.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y = clamp(velocity.y + gravity * delta, -500, 500)

	var direction = Input.get_axis("player_move_left", "player_move_right")
	if direction != 0:
		facing_direction = sign(direction)
		animated_sprite.flip_h = (direction == -1)
		
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = -jump_force
		
	velocity.x = lerp(velocity.x, direction * speed, acceleration)
	update_animations(direction)
	move_and_slide()

func update_animations(direction):
	if is_on_floor():
		
		if Input.is_key_pressed(KEY_H):
			animated_sprite.play("dead")
		elif Input.is_key_pressed(KEY_J):
			animated_sprite.play("hit")
		else:
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
func test_attack(direction):
	print("attack called")
	var hitbox = MELEE_ATTACK_HITBOX.instantiate()
	get_parent().add_child(hitbox)
	hitbox.global_position = global_position + Vector2(MELEE_ATTACK_OFFSET * direction, 0) 


func _unhandled_input(event):
	if Input.is_action_just_pressed("player_attack"):
		print("input attack detected")
		test_attack(facing_direction)
