class_name chrono_slash extends Attack

@onready var colision = $CollisionPolygon2D

var main_animation:AnimatedSprite2D
var main_animation_player:AnimationPlayer
var facing_direction:int = 1  # 1 = droite, -1 = gauche
@onready var caster = $".."


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
	body_entered.connect(_on_body_entered)

func execute():
	main_animation_player.animation_finished.connect(_on_attack_animation_player_animation_finished)
	#animation.flip_h = (caster.facing_direction == -1)
	self.main_animation_player.play("attack")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered():
	pass #TODO gestion collision

func _on_attack_animation_player_animation_finished(anim_name: StringName) -> void:
	main_animation.play("running")
	main_animation_player.animation_finished.disconnect(_on_attack_animation_player_animation_finished)
