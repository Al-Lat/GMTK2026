extends Node

var force_pure;
var hud:CanvasLayer
var shop_hud:Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	force_pure = 0;

func add_time(speed:int) -> void:
	force_pure += speed;
	hud.update_strength()
	if (shop_hud != null):
		shop_hud.update_strength()

func remove_time(speed:int) -> void:
	force_pure -= speed;
	hud.update_strength()
	if (shop_hud != null):
		shop_hud.update_strength()
