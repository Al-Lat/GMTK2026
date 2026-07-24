extends Area2D

const SPEED = 200.0
const LIFETIME = 3.0  # sécurité si rien n'est touché (évite un projectile infini)

var direction: Vector2 = Vector2.RIGHT

@onready var animated_sprite: AnimatedSprite2D = $attack_animation

func _ready() -> void:

	animated_sprite.play("default")
	body_entered.connect(_on_body_entered)
	get_tree().create_timer(LIFETIME).timeout.connect(queue_free)

func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta

func _on_body_entered(body: Node) -> void:
	
	print("Touché : ", body.name)
		# body.take_damage(10) plus tard
	queue_free()  # le projectile disparaît à tout impact, y compris un mur
