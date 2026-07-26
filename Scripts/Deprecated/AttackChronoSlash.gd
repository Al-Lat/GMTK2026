class_name AttackChronoSlash extends MobAttack


func _init(cooldown_timer:Timer):
	super(cooldown_timer)
	self.attack_type = AttackType.MELEE
	self.attack_scene = preload("res://Scenes/AttackScenes/small_chrono_slash.tscn")
	self.cooldown = 2
	self.cooldown_timer.timeout.connect(self.allow_fire)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func summon(entity) -> void:
	if is_allowed_fire:
		is_allowed_fire = false
		var attack = self.attack_scene.instantiate()
		attack.caster = entity
		entity.add_child(attack);
		
		
		
		self.cooldown_timer.start()
