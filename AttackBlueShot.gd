class_name AttackBlueShot extends Attack

func _init():
	self.attack_type = AttackType.RANGED
	self.attack_scene = preload("res://Scenes/AttackScenes/blue_shot.tscn")

func summon(entity) -> void:
	var projectile = self.attack_scene.instantiate()
	entity.get_parent().add_child(projectile)
	projectile.global_position = entity.global_position + entity.direction_to_mouse * entity.RANGED_ATTACK_OFFSET
	projectile.rotation = entity.direction_to_mouse.angle()
	projectile.direction = entity.direction_to_mouse.normalized()
