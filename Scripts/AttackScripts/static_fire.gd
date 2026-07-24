extends Area2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D

var life_duration = 3.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("start")
	if life_duration != null:
		var timer = get_node("Timer")
		timer.set_wait_time(life_duration)
		print("timer called")
		timer.start()
	
	

func _on_body_entered(body):
	print("Touché : ", body.name) #TODO implementer les effets sur les mobs
	if (body.is_in_group("missiles")):
		body.queue_free()

func _on_timer_timeout() -> void:
	animated_sprite.play("end")


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "start":
		animated_sprite.play("burning")
	elif animated_sprite.animation == "end":
		self.queue_free()
		
		
