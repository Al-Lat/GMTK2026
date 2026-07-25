extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const MISSILE = preload("res://Scenes/missile.tscn")
var in_range = false
var player = null
var couldown_end = true
var life = 10
var orientation = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("idle")

func _process(delta: float) -> void:
	if in_range && (player.global_position.x - self.global_position.x) * orientation < 0:
		orientation *= -1
		animated_sprite.flip_h = not animated_sprite.flip_h
	if (in_range && couldown_end): 
		couldown_end = false
		$couldown.start()
		var missile = MISSILE.instantiate();
		add_child(missile);
		missile.player = player

func _on_detection_body_entered(body: Node2D) -> void:
	if (body.name == "Player"):
		player = body
		in_range = true

func _on_detection_body_exited(body: Node2D) -> void:
	if (body.name == "Player"):
		in_range = false


func _on_timer_timeout() -> void:
	couldown_end = true;
