class_name MobAttack extends RefCounted

const enumClass = preload("res://Scripts/AttackSystem/AttackType.gd")
#permet aux classes d'acceder a l'enum du type d'attack
const AttackType = enumClass.AttackType

var cooldown : int
var cooldown_timer : Timer
var attack_type : AttackType
var attack_scene : RefCounted
var target

var is_allowed_fire = true

func _init(cooldown_timer:Timer):
	self.target = PlayerSingleton.player
	self.cooldown_timer = cooldown_timer

func summon(entity) -> void:
	#methode par defaut -> none
	pass

func allow_fire()->void:
	self.is_allowed_fire=true
