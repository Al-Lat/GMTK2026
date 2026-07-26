extends Area2D

@onready var colision = $CollisionShape2D
#@onready var anim_player =$AnimationPlayer 
#@onready var animation = $Anims
var main_animation:AnimatedSprite2D
var main_animation_player:AnimationPlayer 
@onready var caster = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_animation =  caster.get_node("Anims")
	main_animation_player =  caster.get_node("DeathAnimationPlayer")
	
	
	
	#ajuster la taille de l'animation
	#animation.scale = main_animation.scale
	
	#cacher l'animation du joueur et lancer l'animation de l'attaque
	#main_animation.visible = false
	#anim_player.play("new_animation")
	
	#connecter le signal pour agir en cas de collision
	body_entered.connect(_on_body_entered)


func execute():
	#ajuster l'animation en fonction du joueur
	#animation.flip_h = (caster.facing_direction == -1)
	main_animation_player.animation_finished.connect(_on_attack_animation_player_animation_finished)
	main_animation_player.play("DeathAnimationPlayer")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered():
	pass #TODO gestion collision

func _on_attack_animation_player_animation_finished(anim_name: StringName) -> void:
	main_animation_player.animation_finished.disconnect(_on_attack_animation_player_animation_finished)
