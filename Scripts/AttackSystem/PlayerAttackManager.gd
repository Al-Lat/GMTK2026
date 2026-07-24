class_name PlayerAttackManager extends Node2D




@onready var player:Player = $".." #noeud parent player

var is_melee_attacking
var is_ranged_attacking

var ranged_attack : Attack
var melee_attack : Attack
var special_attack : Attack

func _init() -> void:
	self.is_melee_attacking = false
	self.is_ranged_attacking = false
	
	self.ranged_attack = AttackFactory.get_player_attack(AttackFactory.PlayerAttack.BLUE_SHOT)
	self.melee_attack = AttackFactory.get_player_attack(AttackFactory.PlayerAttack.BLUE_SLASH)
	self.special_attack = AttackFactory.get_player_attack(AttackFactory.PlayerAttack.STATIC_FIRE)

func process_attacks(delta: float) -> void:
	if melee_attack.isInputPatternOk() && not is_melee_attacking:
		player_melee_attack()
	elif ranged_attack.isInputPatternOk():
		player_ranged_attack()
	elif special_attack.isInputPatternOk():
		player_special_attack()

func set_ranged_attacks(boolValue:bool)->void:
	self.is_ranged_attacking = boolValue

func player_special_attack():
	print("special attack called")
	self.special_attack.summon(self.player)
	
func player_ranged_attack():
	print("ranged attack called")
	self.ranged_attack.summon(self.player)
	

func player_melee_attack():
	print("melee attack called")
	is_melee_attacking = true
	self.melee_attack.summon(self.player)
	is_melee_attacking = false
	
	
	
	
	
