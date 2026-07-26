extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$drones.queue_free()
	$chrono_guard.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
