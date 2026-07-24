class_name Attack extends RefCounted

const enumClass = preload("res://Scripts/AttackSystem/AttackType.gd")
const AttackType = enumClass.AttackType

var attack_type : AttackType
var attack_scene : RefCounted

var __default_input_pattern = func(attack_type:AttackType):
	#adaptation aux types d'attaque
	var button;
	if attack_type == AttackType.RANGED:
		button = "player_attack_ranged"
	elif attack_type == AttackType.SPECIAL:
		button = "player_attack_special"
	elif attack_type == AttackType.MELEE : 
		button = "player_attack_melee"
	#pattern par defaut
	return Input.is_action_just_pressed(button)

func _init(type:AttackType,scene:RefCounted) -> void:
	self.attack_type = type
	self.attack_scene = scene

##Indique si le joueur appuie sur la/les touches nécéssaire à l'invocation de cette attaque
func isInputPatternOk()->bool:
	return __default_input_pattern.call(self.attack_type)

func summon(entity) -> void:
	get_default_side_summon_function().call(entity)
	
func get_default_side_summon_function() -> Callable:
	return func (entity) :
		print("default summon")
		var attackElement = self.attack_scene.instantiate()
		entity.get_parent().add_child(attackElement)
		attackElement.global_position = entity.global_position + Vector2(entity.facing_direction * entity.MELEE_ATTACK_OFFSET,0)
