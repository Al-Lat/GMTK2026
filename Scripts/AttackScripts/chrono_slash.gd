class_name chrono_slash extends Area2D

@onready var colision = $CollisionPolygon2D

var main_animation:AnimatedSprite2D
var main_animation_player:AnimationPlayer
var facing_direction:int = 1  # 1 = droite, -1 = gauche
var damage = 5
@onready var caster = $".."
@onready var chrono_slash: chrono_slash = $"."


func _ready() -> void:
	main_animation =  caster.get_node("Anims")
	main_animation_player = caster.get_node("AttackAnimationPlayer")
	
	#cacher l'animation du joueur et ajuster l'animation en fonction du joueur
	#main_animation.visible = false
	#cacher l'animation du joueur et lancer l'animation de l'attaque
	#anim_player.play("attack")
	
	#ajuster la taille de l'animation
	#animation.scale = main_animation.scale

	#connecter le signal pour agir en cas de collision

func execute():
	main_animation_player.animation_finished.connect(_on_attack_animation_player_animation_finished)
	#animation.flip_h = (caster.facing_direction == -1)
	self.main_animation_player.play("attack")

func _on_attack_animation_player_animation_finished(anim_name: StringName) -> void:
	main_animation.play("running")
	main_animation_player.animation_finished.disconnect(_on_attack_animation_player_animation_finished)


func _on_body_entered(body: Node2D) -> void:
	print("touché",body)
	if body.name == "Player":
		body.take_damage(self.damage)
