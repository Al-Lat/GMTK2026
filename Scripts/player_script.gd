extends CharacterBody2D


@export var gravity:float = 1000.0
@export var speed:float = 500.0
@export var jump_force:float = 800.0

@export var acceleration:float = 0.2

@export var facing_direction:int = 1  # 1 = droite, -1 = gauche

@export var direction_to_mouse: Vector2 = Vector2.ZERO

@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.play("idle")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y = clamp(velocity.y + gravity * delta, -800, 1000)

	var direction_movment = Input.get_axis("player_move_left", "player_move_right")
	
	facing_direction = sign(direction_to_mouse.x)
	animated_sprite.flip_h = (facing_direction == -1)
		
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = -jump_force
		
	velocity.x = lerp(velocity.x, direction_movment * speed, acceleration)
	update_animations(direction_movment)
	move_and_slide()

func _process(delta: float) -> void:
	var raw = get_global_mouse_position() - global_position
	if raw.length() > 0:
		self.direction_to_mouse = raw.normalized()

func update_animations(direction_movment):
	if is_on_floor():
		
		if Input.is_key_pressed(KEY_H):
			animated_sprite.play("dead")
		elif Input.is_key_pressed(KEY_J):
			animated_sprite.play("hit")
		elif Input.is_key_pressed(KEY_K):
			animated_sprite.play("attack_slash")
		else:
			if direction_movment == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		


func _unhandled_input(event):
	if Input.is_action_just_pressed("player_attack_special"):
		AttackClass.special_attack(self,self.direction_to_mouse)
		
	elif Input.is_action_just_pressed("player_attack_melee"):
		AttackClass.melee_attack(self,self.direction_to_mouse)
		
	elif Input.is_action_just_pressed("player_attack_remote"):
		AttackClass.ranged_attack(self,self.direction_to_mouse)
