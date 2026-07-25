class_name AttackBlueSlash extends Attack

func _init():
	self.attack_type = AttackType.MELEE
	self.attack_scene = preload("res://Scenes/AttackScenes/blue_slash.tscn")
	self.cooldown = 0.8

func isInputPatternOk()->bool:
	return Input.is_action_pressed("player_attack_melee")

func summon(entity:Player) -> void:
	if self.is_allowed_fire:
		print("default summon")
		self.is_allowed_fire = false
		var attackElement = self.attack_scene.instantiate()
		#entity.animated_sprite.visible = false
		entity.add_child(attackElement)
		attackElement.global_position = entity.global_position + Vector2(entity.facing_direction * entity.MELEE_ATTACK_OFFSET,0)
		entity.get_tree().create_timer(self.cooldown).timeout.connect(self.allow_fire)
