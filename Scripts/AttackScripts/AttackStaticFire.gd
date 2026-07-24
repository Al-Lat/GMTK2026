class_name AttackStaticFire extends Attack

const ATTACK_RANGE = 240

func _init():
	self.attack_type = AttackType.SPECIAL
	self.attack_scene = preload("res://Scenes/AttackScenes/static_fire.tscn")
	self.cooldown = 2.5

func summon(entity) -> void:
	if self.is_allowed_fire:
		self.is_allowed_fire = false
		var projectile = self.attack_scene.instantiate()
		entity.get_parent().add_child(projectile)
		projectile.global_position = entity.global_position + entity.direction_to_mouse * ATTACK_RANGE
		projectile.rotation = entity.direction_to_mouse.angle()
		entity.get_tree().create_timer(self.cooldown).timeout.connect(self.allow_fire)
