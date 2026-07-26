class_name AttackFactory extends RefCounted

const enumClass = preload("res://Scripts/AttackSystem/AttackType.gd")
const AttackType = enumClass.AttackType


#player attacks
enum PlayerAttackEnum{
	BLUE_SLASH ,
	BLUE_SHOT,
	STATIC_FIRE
}


static func get_player_attack(name:PlayerAttackEnum,player:Player)->PlayerAttack:
	match name:
		PlayerAttackEnum.BLUE_SLASH:
			return AttackBlueSlash.new(player)
		PlayerAttackEnum.BLUE_SHOT:
			return AttackBlueShot.new(player)
		PlayerAttackEnum.STATIC_FIRE:
			return AttackStaticFire.new(player)
		_:
			return null
