class_name AttackBlueShot extends PlayerAttack


func _init(player:Player):
	super(player)
	self.attack_type = AttackType.RANGED
	self.attack_scene = preload("res://Scenes/AttackScenes/blue_shot.tscn")
	self.cooldown = 0.5
	self.ranged_cooldown_timer.timeout.connect(self.allow_fire)

func isInputPatternOk()->bool:
	return Input.is_action_pressed("player_attack_ranged")

func summon() -> void:
	if self.is_allowed_fire:
		is_allowed_fire = false
		var projectile = self.attack_scene.instantiate()
		self.player.add_child(projectile)
		projectile.global_position = self.player.global_position + self.player.direction_to_mouse * self.player.RANGED_ATTACK_OFFSET
		projectile.rotation = self.player.direction_to_mouse.angle()
		projectile.direction = self.player.direction_to_mouse.normalized()
		self.ranged_cooldown_timer.start(self.cooldown)
