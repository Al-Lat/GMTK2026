class_name PlayerAttackManager extends Node2D



@onready var player:Player = $".." #parent type player

var is_melee_attacking
var is_ranged_attacking

var ranged_attack : PlayerAttack
var melee_attack : PlayerAttack
var special_attack : PlayerAttack

func _ready() -> void:
	var ranged_cooldown = self.player.get_node("ranged_cooldown")
	
	self.is_melee_attacking = false
	self.is_ranged_attacking = false
	
	self.ranged_attack = AttackFactory.get_player_attack(AttackFactory.PlayerAttackEnum.BLUE_SHOT, player)
	self.melee_attack = AttackFactory.get_player_attack(AttackFactory.PlayerAttackEnum.BLUE_SLASH, player)
	self.special_attack = AttackFactory.get_player_attack(AttackFactory.PlayerAttackEnum.STATIC_FIRE, player)

func process_attacks(delta: float) -> void:
	if melee_attack.isInputPatternOk() && not is_melee_attacking:
		player_melee_attack()
	elif ranged_attack.isInputPatternOk():
		player_ranged_attack()
	elif PlayerSingleton.special_attack && special_attack.isInputPatternOk():
		player_special_attack()

func set_ranged_attacks(boolValue:bool)->void:
	self.is_ranged_attacking = boolValue

func player_special_attack():
	#print("special attack called")
	self.special_attack.summon()
	
func player_ranged_attack():
	#print("ranged attack called")
	self.ranged_attack.summon()
	

func player_melee_attack():
	#print("melee attack called")
	is_melee_attacking = true
	self.melee_attack.summon()
	is_melee_attacking = false
	
	
	
	
	
