extends Area2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D

var life_duration = 5.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if life_duration != null:
		var timer = get_node("Timer")
		timer.set_wait_time(life_duration)
		print("timer called")
		timer.start()
	animated_sprite.play()

func _on_body_entered(body):
	print("Touché : ", body.name) #TODO implementer les effets sur les mobs

func _on_timer_timeout() -> void:
	self.queue_free()
