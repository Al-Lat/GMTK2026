extends Node2D

func _ready() -> void:
	$sprite.play("default")

func _on_acheter_pressed() -> void:
	if (LifeIsLife.temps >= 200):
		LifeIsLife.remove_time(200)
		PlayerSingleton.special_attack = true
		$acheter.disabled = true
