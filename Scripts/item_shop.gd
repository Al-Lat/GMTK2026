extends Node2D

var prix:int = 0
var nom:String = ""
var acheter = true

func set_sprite(sprite_selected:String):
	$sprite.play(sprite_selected)

func set_nom(nom:String):
	self.nom = nom
	$nom.text = nom

func set_prix(prix:int):
	self.prix = prix
	$prix.text = str(prix)

func set_button(activer:bool):
	acheter = activer
	if activer :
		$acheter.text = "buy"
	else :
		$acheter.text = "sell"

func _on_acheter_pressed() -> void:
	if acheter :
		if nom == "robot legs":
			print("buy legs")
			if LifeIsLife.temps >= prix:
				print("okay")
				LifeIsLife.remove_time(prix)
				Speedrun.add_time(1)
		elif nom == "robot arms":
			if LifeIsLife.temps >= prix:
				LifeIsLife.remove_time(prix)
				KillThemAll.add_time(1)
		elif nom == "robot gears":
			if LifeIsLife.temps >= prix:
				LifeIsLife.remove_time(prix)
				KillThemFast.add_time(1)
	else :
		if nom == "robot legs":
			if Speedrun.we_are_speed >= 1:
				Speedrun.remove_time(1)
				LifeIsLife.add_time(prix)
		elif nom == "robot arms":
			if KillThemAll.force_pure >= 1:
				KillThemAll.remove_time(1)
				LifeIsLife.add_time(prix)
		elif nom == "robot gears":
			if KillThemFast.force_rapide >= 1:
				KillThemFast.remove_time(1)
				LifeIsLife.add_time(prix)
