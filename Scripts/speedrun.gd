extends Node
signal update_speed

var we_are_speed;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	we_are_speed = 0;

func add_time(speed:int) -> void:
	we_are_speed += speed;
	update_speed.emit()

func remove_time(speed:int) -> void:
	we_are_speed -= speed;
	update_speed.emit()
