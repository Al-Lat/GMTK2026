class_name MobAttack extends RefCounted

const enumClass = preload("res://Scripts/AttackSystem/AttackType.gd")
#permet aux classes d'acceder a l'enum du type d'attack
const AttackType = enumClass.AttackType

var cooldown : int
var attack_type : AttackType
var attack_scene : RefCounted

func _ready():
	var target = PlayerSingleton.player

func summon(entity) -> void:
	var attack = self.attack_scene.instantiate();
	entity.add_child(attack);
	attack.target = self.target
