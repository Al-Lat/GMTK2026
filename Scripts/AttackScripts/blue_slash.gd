extends Area2D

@onready var area = $"."
@onready var colision = $attack_colision2d
@onready var animation = $attack_animation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("attack_slash")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#TODO traitement collision

func _on_attack_animation_animation_finished() -> void:
	queue_free()
