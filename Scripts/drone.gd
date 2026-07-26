extends Mob

@onready var animated_sprite = $AnimatedSprite2D
@onready var cooldown_timer = $cooldown

const MISSILE = preload("res://Scenes/missile.tscn")
var in_range = false
var player = null
var orientation = 1
var is_allowed_missile = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.health = 10
	animated_sprite.play("idle")
	#self.attack = AttackFactory.get_mob_attack(AttackFactory.MobAttackEnum.MISSILE,$cooldown)

func _process(delta: float) -> void:
	if in_range && (player.global_position.x - self.global_position.x) * orientation < 0:
		orientation *= -1
		animated_sprite.flip_h = not animated_sprite.flip_h
	if (in_range):
		self.summon_missile(player)

func _on_detection_body_entered(body: Node2D) -> void:
	print(body.name)
	if (body.name == "Player"):
		player = body
		in_range = true

func _on_detection_body_exited(body: Node2D) -> void:
	if (body.name == "Player"):
		in_range = false




func summon_missile(target) -> void:
	if is_allowed_missile:
		is_allowed_missile = false
		var attack = self.MISSILE.instantiate();
		self.add_child(attack);
		attack.target = target
		
		self.cooldown_timer.start()

func allow_missile():
	self.is_allowed_missile = true

func _on_cooldown_timeout() -> void:
	self.allow_missile()
