extends Area2D


@onready var colision = $attack_colision2d
@onready var anim_player =$AnimationPlayer 
@onready var animation = $playerAnimation
var parent:CharacterBody2D

var player_singleton = PlayerSingleton
var player:Player
var mainAnimation:AnimatedSprite2D 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = $".."
	player = player_singleton.player
	animation.flip_h = (player.facing_direction == -1)
	animation.position.x += player.facing_direction * 16
	
	mainAnimation =  parent.get_node("playerAnimation")
	
	print("position avant : ",mainAnimation.position.x)
	mainAnimation.visible = false
	anim_player.play("new_animation")
	print("position apres : ",mainAnimation.position.x)
	
	body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#animation.position.x *= player.facing_direction

#TODO traitement collision
func _on_body_entered(body: Node) -> void:
	print("blue_slash : Touché : ", body.name)
	if (body.is_in_group("missiles")):
		body.queue_free()



	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("blue_slash : self delete")
	mainAnimation.visible = true
	queue_free()
