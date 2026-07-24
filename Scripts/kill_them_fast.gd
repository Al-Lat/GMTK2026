extends Node
signal update_strength

var force_rapide;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	force_rapide = 0;

func add_time(speed:int) -> void:
	force_rapide += speed;
	update_strength.emit()

func remove_time(speed:int) -> void:
	force_rapide -= speed;
	update_strength.emit()
