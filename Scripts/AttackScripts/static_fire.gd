extends Area2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var life_timer = $LifeTimer

var life_duration = 3.0
var time_between_damage_ticks = 0.2
var damage = 35
var hit_list : Dictionary

func _init():
	hit_list = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	animated_sprite.play("start")
	if life_duration != null:
		
		life_timer.set_wait_time(life_duration)
		print("timer called")
		life_timer.start()
	
func _physics_process(delta: float) -> void:
	for body in get_overlapping_bodies():
		_handle_body_in_zone(body)

func _handle_body_in_zone(body: Node2D) -> void:
	if body.is_in_group("Mobs"):
		#print("static fire : has body check ",body," ",hit_list.has(body))
		if hit_list.has(body):
			var timerOfBody = hit_list[body]
			print("static fire : body already in hit_list ",body, " with timer ",timerOfBody," time : ",timerOfBody.time_left)
			if timerOfBody.is_stopped():
				print("static fire : damaging ",body)
				body.take_damage(self.damage)
				timerOfBody.start(time_between_damage_ticks)
			#else : entre les tick, on ne fait rien
		else:
			var newTimer = Timer.new()
			newTimer.one_shot = true
			self.add_child(newTimer)
			hit_list[body] = newTimer
			print("static fire : added pair in hit list -> ",body," ",newTimer)
			body.take_damage(self.damage)
			newTimer.start(time_between_damage_ticks)

func _on_body_entered(body):
	print("Touché : ", body.name) #TODO implementer les effets sur les mobs
	if (body.is_in_group("destroyable_mobs_projectile")):
		body.impact()


func _on_body_exited(body):
	if hit_list.has(body):
		var t = hit_list[body]
		t.queue_free()
		hit_list.erase(body)

func _on_timer_timeout() -> void:
	animated_sprite.play("end")


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "start":
		animated_sprite.play("burning")
	elif animated_sprite.animation == "end":
		self.queue_free()
		
		
