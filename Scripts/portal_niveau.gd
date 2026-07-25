extends Area2D

@onready var animated_sprite = $AnimatedSprite2D


var in_portal = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_portal && Input.is_action_pressed("interaction"):
		get_tree().change_scene_to_file("res://Scenes/map.tscn")


func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	in_portal = true


func _on_body_exited(body: Node2D) -> void:
	in_portal = false
