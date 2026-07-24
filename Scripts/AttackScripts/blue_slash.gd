extends Area2D


@onready var colision = $attack_colision2d
#@onready var animation = $attack_animation
var parent:CharacterBody2D

var player_singleton = PlayerSingleton
var player:Player
var mainAnimation:AnimatedSprite2D 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = $".."
	player = player_singleton.player
	mainAnimation =  parent.get_node("playerAnimation")
	print("position avant : ",mainAnimation.position.x)
	mainAnimation.position.x += player.facing_direction * 16
	mainAnimation.play("blue_slash")
	print("position apres : ",mainAnimation.position.x)
	body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mainAnimation.position.x *= player.facing_direction

#TODO traitement collision
func _on_body_entered(body: Node) -> void:
	print("blue_slash : Touché : ", body.name)


func _animation_finished() -> void:
	print("blue_slash : self delete")
	mainAnimation.position.x = 0
	queue_free()
