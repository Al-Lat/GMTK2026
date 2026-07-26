extends Area2D

const SPEED = 200.0
const LIFETIME = 3.0  # sécurité si rien n'est touché (évite un projectile infini)
const BASE_DAMAGE = 50

var direction: Vector2 = Vector2.RIGHT

var damage = 50

@onready var animated_sprite: AnimatedSprite2D = $attack_animation
@onready var LIFE_TIMER: Timer = $LIFETIME

func _ready() -> void:
	execute()
	
func execute() -> void:
	animated_sprite.play("default")
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta

func _on_body_entered(body: Node) -> void:
	damage = BASE_DAMAGE * (1 + 0.1 * KillThemAll.force_pure)
	print("Touché : ", body.name)
	if (body.is_in_group("destroyable_mobs_projectile")):
		body.impact()
	if (body.is_in_group("Mobs")):
		body.take_damage(self.damage)
	
	
	self.impact()  # le projectile disparaît à tout impact, y compris un mur

func impact():
	#TODO jouer explosion impact
	queue_free()
