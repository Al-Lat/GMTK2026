class_name missile extends RigidBody2D

var speed = 200
var target = null
var damage = 50

func _ready() -> void:
	$disparition.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = (target.global_position - self.global_position).normalized()
	self.rotation = direction.angle()
	var collision = move_and_collide(direction * speed * delta);
	 #print("missile direction:",direction," collision ",collision, " rotation ",self.rotation)
	if collision :
		collision_detected(collision);

func collision_detected(collision):
	var body := collision.get_collider() as Node2D
	print("missile : collision on : ",body)
	if(body.is_in_group("player")):
		body.take_damage(self.damage)
	
	impact()
		


func _on_disparition_timeout() -> void:
	impact()

func impact():
	queue_free()
