extends Area2D

@onready var shop_hud: CanvasLayer = $shop_hud
@onready var label_text_shop: Label = $LabelTextShop
var interactable_truck = false
var in_shop = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(player_detected)
	body_exited.connect(player_lost)
	shop_hud.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interactable_truck and Input.is_action_pressed("interaction") and in_shop == false:
		print("dans shop")
		shop_hud.visible = true
		in_shop = true

func player_detected(body:Node2D) -> void:
	if body.name == "Player":
		label_text_shop.visible = true
		interactable_truck = true

func player_lost(body:Node2D) -> void:
	if body.name == "Player":
		label_text_shop.visible = false
		interactable_truck = false
		if in_shop:
			in_shop = false
			shop_hud.visible = false

func _on_shop_hud_quitter() -> void:
	in_shop = false
