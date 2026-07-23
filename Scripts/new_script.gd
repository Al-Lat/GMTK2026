class Attack :
	
	const SPECIAL_ATTACK_HITBOX = preload("res://Scenes/static_fire_attack.tscn")
	const SPECIAL_ATTACK_OFFSET = 300.0

	#const RANGED_ATTACK_HITBOX = 
	const RANGED_ATTACK_OFFSET = 40.0

	#const MELEE_ATTACK_HITBOX = 
	const MELEE_ATTACK_OFFSET = 40.0
	
	static func special_attack(Node caller , Vector2 direction_to_mouse):
		print("special attack called")
		var hitbox = SPECIAL_ATTACK_HITBOX.instantiate()
		caller.get_parent().add_child(hitbox)
		hitbox.global_position = global_position + direction_to_mouse * SPECIAL_ATTACK_OFFSET
		hitbox.rotation = direction_to_mouse.angle()
		
	static func ranged_attack(direction_to_mouse):
		print("ranged attack called")
		var hitbox = SPECIAL_ATTACK_HITBOX.instantiate()
		get_parent().add_child(hitbox)
		hitbox.global_position = global_position + direction_to_mouse * RANGED_ATTACK_OFFSET
		hitbox.rotation = direction_to_mouse.angle()

	static func melee_attack(direction_to_mouse):
		print("melee attack called")
		var hitbox = SPECIAL_ATTACK_HITBOX.instantiate()
		get_parent().add_child(hitbox)
		hitbox.global_position = global_position + direction_to_mouse * MELEE_ATTACK_OFFSET
		
		
