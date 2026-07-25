class_name PlayerAttack extends RefCounted

const enumClass = preload("res://Scripts/AttackSystem/AttackType.gd")
#permet aux classes d'acceder a l'enum du type d'attack
const AttackType = enumClass.AttackType

var cooldown : int
var attack_type : AttackType
var attack_scene : RefCounted
var player : Player

var ranged_cooldown_timer
var melee_cooldown_timer
var special_cooldown_timer

var is_allowed_fire = true

func _init(player:Player):
	self.player = player
	
	self.ranged_cooldown_timer = self.player.get_node("ranged_cooldown")
	self.melee_cooldown_timer = self.player.get_node("melee_cooldown")
	self.special_cooldown_timer = self.player.get_node("special_cooldown")
	print("init timer ranged : ",self.ranged_cooldown_timer)



##Indique si le joueur appuie sur la/les touches nécéssaire à l'invocation de cette attaque
func isInputPatternOk()->bool:
	var button;
	if attack_type == AttackType.RANGED:
		button = "player_attack_ranged"
	elif attack_type == AttackType.SPECIAL:
		button = "player_attack_special"
	elif attack_type == AttackType.MELEE : 
		button = "player_attack_melee"
	else :
		return false
	#pattern par defaut
	return Input.is_action_just_pressed(button)

##Fonction permettant d'instancier la scene liée à l'attaque, 
##si override alors la logique de tir automatique/gestion des inputs maintenu 
##et spams doit etre refait dans la nouvelle implementation
func summon() -> void:
	if self.is_allowed_fire:
		print("default summon")
		self.is_allowed_fire = false
		var attackElement = self.attack_scene.instantiate()
		player.add_child(attackElement)
		attackElement.global_position = player.global_position + Vector2(player.facing_direction * player.MELEE_ATTACK_OFFSET,0)
	
func allow_fire():
	is_allowed_fire = true
	
