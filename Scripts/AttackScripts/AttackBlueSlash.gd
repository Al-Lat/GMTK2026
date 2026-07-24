class_name AttackBlueSlash extends Attack

func _init():
	self.attack_type = AttackType.MELEE
	self.attack_scene = preload("res://Scenes/AttackScenes/blue_slash.tscn")
	
func summon(entity:Player) -> void:
	entity.animated_sprite.visible = false
	super(entity)
	entity.animated_sprite.visible = true
