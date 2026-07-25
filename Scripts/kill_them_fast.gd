extends Node

var force_rapide;
var hud:CanvasLayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	force_rapide = 0;

func add_time(speed:int) -> void:
	force_rapide += speed;
	hud.update_attack_speed()

func remove_time(speed:int) -> void:
	force_rapide -= speed;
	hud.update_attack_speed()
