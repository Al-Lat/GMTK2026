extends Node

var we_are_speed;
var hud:CanvasLayer
var shop_hud:Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	we_are_speed = 0;

func add_time(speed:int) -> void:
	we_are_speed += speed;
	hud.update_speed()
	if (shop_hud != null):
		shop_hud.update_speed()

func remove_time(speed:int) -> void:
	we_are_speed -= speed;
	hud.update_speed()
	if (shop_hud != null):
		shop_hud.update_speed()
