class_name Mob extends CharacterBody2D

var health:int

func take_damage(damage:int):
	if (health - damage) <= 0:
		death()
	else:
		health -= damage

func death():
	self.queue_free()
