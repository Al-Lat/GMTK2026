class_name AttackBlueShot extends Attack

var is_allowed_fire = true
var cooldown = 0.5

func _init():
	self.attack_type = AttackType.RANGED
	self.attack_scene = preload("res://Scenes/AttackScenes/blue_shot.tscn")
	
func isInputPatternOk()->bool:
	return Input.is_action_pressed("player_attack_ranged")

func summon(entity) -> void:
		if is_allowed_fire:
			is_allowed_fire = false
			var projectile = self.attack_scene.instantiate()
			entity.add_child(projectile)
			projectile.global_position = entity.global_position + entity.direction_to_mouse * entity.RANGED_ATTACK_OFFSET
			projectile.rotation = entity.direction_to_mouse.angle()
			projectile.direction = entity.direction_to_mouse.normalized()
			entity.get_tree().create_timer(cooldown).timeout.connect(allow_fire)
	
func allow_fire():
	is_allowed_fire = true
	
	
