class_name AttackFactory extends RefCounted

const enumClass = preload("res://Scripts/AttackSystem/AttackType.gd")
const AttackType = enumClass.AttackType


#player attacks
enum PlayerAttack{
	BLUE_SLASH ,
	BLUE_SHOT,
	STATIC_FIRE
}

#mob attacks

static func get_player_attack(name:PlayerAttack)->Attack:
	match name:
		PlayerAttack.BLUE_SLASH:
			return AttackBlueSlash.new()
		PlayerAttack.BLUE_SHOT:
			return AttackBlueShot.new()
		PlayerAttack.STATIC_FIRE:
			return AttackStaticFire.new()
		_:
			return null
