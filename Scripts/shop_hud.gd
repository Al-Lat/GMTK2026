extends CanvasLayer
signal quitter

func _ready() -> void:
	set_item($buy_robot_legs, "robot legs", "robot_legs", 40, true)
	set_item($buy_robot_arms, "robot arms", "robot_arms", 50, true)
	set_item($buy_robot_gears, "robot gears", "robot_gears", 20, true)
	set_item($sell_robot_legs, "robot legs", "robot_legs", 35, false)
	set_item($sell_robot_arms, "robot arms", "robot_arms", 40, false)
	set_item($sell_robot_gears, "robot gears", "robot_gears", 15, false)

func _on_button_pressed() -> void:
	print("bouton presser")
	self.visible = false
	quitter.emit()

func set_item(item:Node2D, nom:String, sprite:String, prix:int, activer:bool):
	item.set_sprite(sprite)
	item.set_nom(nom)
	item.set_prix(prix)
	item.set_button(activer)
