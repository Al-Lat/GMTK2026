class_name AttackBlueSlash extends Attack

func _init():
	self.attack_type = AttackType.RANGED
	self.attack_scene = preload("res://Scenes/AttackScenes/blue_slash.tscn")
