extends Node

var we_are_speed;
var hud:CanvasLayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	we_are_speed = 0;

func add_time(speed:int) -> void:
	we_are_speed += speed;
	hud.update_speed()

func remove_time(speed:int) -> void:
	we_are_speed -= speed;
	hud.update_speed()
