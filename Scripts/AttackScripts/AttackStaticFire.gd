class_name AttackStaticFire extends Attack

const ATTACK_RANGE = 240

func _init():
	self.attack_type = AttackType.SPECIAL
	self.attack_scene = preload("res://Scenes/AttackScenes/static_fire.tscn")

func summon(entity) -> void:
	var projectile = self.attack_scene.instantiate()
	entity.get_parent().add_child(projectile)
	projectile.global_position = entity.global_position + entity.direction_to_mouse * ATTACK_RANGE
	projectile.rotation = entity.direction_to_mouse.angle()
