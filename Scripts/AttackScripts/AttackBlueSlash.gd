class_name AttackBlueSlash extends PlayerAttack

func _init(player:Player):
	super(player)
	self.attack_type = AttackType.MELEE
	self.attack_scene = preload("res://Scenes/AttackScenes/blue_slash.tscn")
	self.cooldown = 0.8
	self.melee_cooldown_timer.timeout.connect(self.allow_fire)

func isInputPatternOk()->bool:
	return Input.is_action_pressed("player_attack_melee")

func summon() -> void:
	if self.is_allowed_fire:
		print("default summon")
		self.is_allowed_fire = false
		var attackElement = self.attack_scene.instantiate()
		#entity.animated_sprite.visible = false
		self.player.add_child(attackElement)
		attackElement.global_position = self.player.global_position + Vector2(self.player.facing_direction * self.player.MELEE_ATTACK_OFFSET,0)
		self.melee_cooldown_timer.start(self.cooldown)
