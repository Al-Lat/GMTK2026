extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if MapSingleton.side != "top":
		$chrono_guard.queue_free()
	if MapSingleton.side != "mid":
		$small_chrono_guard.queue_free()
	if MapSingleton.side != "bot":
		$drones.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
