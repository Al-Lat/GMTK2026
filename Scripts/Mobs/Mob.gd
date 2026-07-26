class_name Mob extends CharacterBody2D

var life:float

func take_damage(damage:float)->void:
	pass

func death():
	self.queue_free()
