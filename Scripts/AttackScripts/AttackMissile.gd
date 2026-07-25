class_name AttackMissile extends MobAttack


func _init():
	self.attack_type = AttackType.RANGED
	self.attack_scene = preload("res://Scenes/missile.tscn")
	self.cooldown = 1.2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func summon(entity) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
