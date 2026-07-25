extends RigidBody2D

var speed = 200
var target = null

func _ready() -> void:
	$disparition.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = (target.global_position - self.global_position).normalized()
	self.rotation = direction.angle()
	var collision = move_and_collide(direction * speed * delta);
	#print("missile direction:",direction," collision ",collision, " rotation ",self.rotation)
	if collision :
		collision_detected();

func collision_detected():
	queue_free()

func _on_disparition_timeout() -> void:
	queue_free()
