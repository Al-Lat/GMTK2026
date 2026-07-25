class_name AttackMissile extends MobAttack


func _init(cooldown_timer:Timer):
	super(cooldown_timer)
	self.attack_type = AttackType.RANGED
	self.attack_scene = preload("res://Scenes/missile.tscn")
	self.cooldown = 1.2
	self.cooldown_timer.timeout.connect(self.allow_fire)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func summon(entity) -> void:
	if is_allowed_fire:
		is_allowed_fire = false
		var attack = self.attack_scene.instantiate();
		entity.add_child(attack);
		print("target : ",self.target)
		attack.target = self.target
		
		self.cooldown_timer.start(self.cooldown)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
