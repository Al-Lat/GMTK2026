class_name AttackClass extends RefCounted

const SPECIAL_ATTACK_HITBOX = preload("res://Scenes/static_fire_attack.tscn")
const SPECIAL_ATTACK_OFFSET = 300.0

const RANGED_ATTACK_HITBOX = preload("res://Scenes/remote_attack.tscn")
const RANGED_ATTACK_OFFSET = 110
const RANGED_ATTACK_RANGE = 400.0

#const MELEE_ATTACK_HITBOX = 
const MELEE_ATTACK_OFFSET = 40.0

static func special_attack(caller:Node , direction_to_mouse:Vector2):
	print("special attack called")
	var hitbox = SPECIAL_ATTACK_HITBOX.instantiate()
	caller.get_parent().add_child(hitbox)
	hitbox.global_position = caller.global_position + direction_to_mouse * SPECIAL_ATTACK_OFFSET
	hitbox.rotation = direction_to_mouse.angle()
	
static func ranged_attack(caller:Node , direction_to_mouse:Vector2):
	print("ranged attack called")
	var facing_direction = sign(direction_to_mouse.x)
	var projectile = RANGED_ATTACK_HITBOX.instantiate()
	
	caller.get_parent().add_child(projectile)
	projectile.global_position = caller.global_position + direction_to_mouse * RANGED_ATTACK_OFFSET
	projectile.rotation = direction_to_mouse.angle()
	projectile.direction = direction_to_mouse.normalized()
	
	

static func melee_attack(caller:Node , direction_to_mouse:Vector2):
	print("melee attack called")
	var hitbox = SPECIAL_ATTACK_HITBOX.instantiate()
	var facing_direction = sign(direction_to_mouse.x)
	caller.get_parent().add_child(hitbox)
	hitbox.global_position = caller.global_position + facing_direction * MELEE_ATTACK_OFFSET
	
