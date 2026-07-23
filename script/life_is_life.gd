extends Node
signal update_temps

var temps;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	temps = 100;
	start_level()

func add_time(time:int) -> void:
	temps += time;
	update_temps.emit()

func remove_time(time:int) -> void:
	temps -= time;
	update_temps.emit()

func end_level() -> void:
	$life_is_moins.stop();

func start_level() -> void:
	$life_is_moins.start()
