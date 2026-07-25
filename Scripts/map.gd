extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Elements/Portals/portail_1.animation_to_play("default")
	$Elements/Portals/portail_2_1.animation_to_play("default")
	$Elements/Portals/portail_2_2.animation_to_play("default")
	$Elements/Portals/portail_2_3.animation_to_play("default")
	$Elements/Portals/boutique_1_1.animation_to_play("shop")
	$Elements/Portals/boutique_1_2.animation_to_play("shop")
	$Elements/Portals/boutique_1_3.animation_to_play("shop")
	$Elements/Portals/boutique_2_1.animation_to_play("shop")
	$Elements/Portals/boutique_2_2.animation_to_play("shop")
	$Elements/Portals/boutique_2_3.animation_to_play("shop")
	$Elements/Portals/boss.animation_to_play("boss")
	$Elements/Portals/boss.scale *= 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		var mouse_pos = get_local_mouse_position()
		
		var play_rect_l_1 = $level1.shape.get_rect()
		play_rect_l_1.position += $level1.position 
		
		if play_rect_l_1.has_point(mouse_pos):
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/niveau_1.tscn")
		
		var play_rect_b_1_1 = $b_1_1.shape.get_rect()
		play_rect_b_1_1.position += $b_1_1.position 
		
		if play_rect_b_1_1.has_point(mouse_pos):
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/interNiveau.tscn")
