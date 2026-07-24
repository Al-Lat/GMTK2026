class_name AttackBlueSlash extends Attack



func _init():
	self.attack_type = AttackType.MELEE
	self.attack_scene = preload("res://Scenes/AttackScenes/blue_slash.tscn")
	
	
func summon(entity:Player) -> void:
	print("default summon")
	var attackElement = self.attack_scene.instantiate()
	
	#entity.animated_sprite.visible = false
	entity.add_child(attackElement)
	attackElement.global_position = entity.global_position + Vector2(entity.facing_direction * entity.MELEE_ATTACK_OFFSET,0)
	
	#await if not attackElement.get_node("attack_animation").is_playing():
		#entity.animated_sprite.visible = true
