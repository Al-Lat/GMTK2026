extends Node

var temps;
var hud:CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	temps = 100;
	end_level()

func add_time(time:int) -> void:
	temps += time;
	hud.update_time()

func remove_time(time:int) -> void:
	temps -= time;
	if temps <= 0:
		temps = 0
		PlayerSingleton.player.mort()
		end_level()
	hud.update_time()

func end_level() -> void:
	$life_is_moins.stop();

func start_level() -> void:
	$life_is_moins.start()
