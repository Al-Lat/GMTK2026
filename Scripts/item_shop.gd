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
		elif nom == "robot arms":
			print("buy arms")
		elif nom == "robot gears":
			print("buy gears")
	else :
		if nom == "robot legs":
			print("sell legs")
		elif nom == "robot arms":
			print("sell arms")
		elif nom == "robot gears":
			print("sell gears")
