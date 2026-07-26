class_name AttackStaticFire extends PlayerAttack

const BASE_COOLDOWN = 2.5
const ATTACK_RANGE = 240

func _init(player:Player):
	super(player)
	self.attack_type = AttackType.SPECIAL
	self.attack_scene = preload("res://Scenes/AttackScenes/static_fire.tscn")
	self.cooldown = 2.5
	self.special_cooldown_timer.timeout.connect(self.allow_fire)

func summon() -> void:
	self.cooldown = BASE_COOLDOWN * (1 - 0.05 * KillThemFast.force_rapide)
	if self.cooldown <= 1.25:
		self.cooldown = 1.25
	if self.is_allowed_fire:
		self.is_allowed_fire = false
		var projectile = self.attack_scene.instantiate()
		self.player.get_parent().add_child(projectile)
		projectile.global_position = self.player.global_position + self.player.direction_to_mouse * ATTACK_RANGE
		projectile.rotation = self.player.direction_to_mouse.angle()
		self.special_cooldown_timer.start(self.cooldown)
