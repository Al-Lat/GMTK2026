extends Area2D



@onready var colision = $attack_colision2d
@onready var anim_player =$AnimationPlayer 
@onready var animation = $playerAnimation
var parent:CharacterBody2D

var player_singleton = PlayerSingleton
var player:Player
var mainAnimation:AnimatedSprite2D 
var damage = 200.0




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	execute()


func execute()->void:
	#ajuster l'animation en fonction du joueur
	parent = $".."
	player = player_singleton.player
	animation.flip_h = (player.facing_direction == -1)
	animation.position.x += player.facing_direction * 16
	
	#cacher l'animation du joueur et lancer l'animation de l'attaque
	mainAnimation =  parent.get_node("playerAnimation")
	mainAnimation.visible = false
	anim_player.play("new_animation")
	
	#connecter le signal pour agir en cas de collision
	body_entered.connect(_on_body_entered)

#TODO traitement collision
func _on_body_entered(body: Node) -> void:
	print("blue_slash : Touché : ", body.name)
	if (body.is_in_group("destroyable_mobs_projectile")):
		body.queue_free()
	if (body.is_in_group("Mobs")):
		body.take_damage(self.damage)
	



	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("blue_slash : self delete")
	mainAnimation.visible = true
	queue_free()
