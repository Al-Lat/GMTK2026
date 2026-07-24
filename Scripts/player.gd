extends CharacterBody2D

@export var gravity = 340
@export var speed = 500
@export var jump_force = 220

@export var acceleration = 0.2

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y = clamp(velocity.y + gravity * delta, -500, 500)

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		animated_sprite.flip_h = (direction == -1)
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
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
