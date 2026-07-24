extends Node
signal update_strength

var force_pure;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	force_pure = 0;

func add_time(speed:int) -> void:
	force_pure += speed;
	update_strength.emit()

func remove_time(speed:int) -> void:
	force_pure -= speed;
	update_strength.emit()
