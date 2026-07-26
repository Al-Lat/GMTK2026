extends Area2D

@onready var parent = $".."
@onready var animation:AnimatedSprite2D = $"../Boss_Anims"
@onready var main_animation_player:AnimationPlayer = $"../AttackAnimationPlayer"

var damage = 34

func _init() -> void:
	pass # Replace with function body.


func execute():
	main_animation_player.animation_finished.connect(_on_attack_animation_player_animation_finished)
	
	self.animation.flip_h = (parent.facing_direction == -1) #flip dans zone animation
	self.animation.position.x += 62 * parent.facing_direction #flip dans ref position global
	self.animation.position.y += 16 #pas de flip ici
	
	self.main_animation_player.play("attack")



func _on_attack_animation_player_animation_finished():
	main_animation_player.animation_finished.disconnect(_on_attack_animation_player_animation_finished)
	self.animation.flip_h = (parent.facing_direction == -1) #flip dans zone animation
	self.animation.position.x -= 62 * parent.facing_direction #flip dans ref position global
	self.animation.position.y -= 16 #pas de flip ici
	
	animation.play("idle")


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("destroyable_player_projectile")):
		body.impact()
	if (body.is_in_group("Player")):
		body.take_damage(self.damage)
