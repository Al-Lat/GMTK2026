extends Node2D

@onready var level_1: CollisionShape2D = $level1
@onready var b_1_1: CollisionShape2D = $b_1_1
@onready var b_1_2: CollisionShape2D = $b_1_2
@onready var b_1_3: CollisionShape2D = $b_1_3
@onready var level_2_1: CollisionShape2D = $level2_1
@onready var level_2_2: CollisionShape2D = $level2_2
@onready var level_2_3: CollisionShape2D = $level2_3
@onready var b_2_1: CollisionShape2D = $b_2_1
@onready var b_2_2: CollisionShape2D = $b_2_2
@onready var b_2_3: CollisionShape2D = $b_2_3
@onready var level_3: CollisionShape2D = $level3

var map = MapSingleton

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
	next_level()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		#détection souris
		var mouse_pos = get_local_mouse_position()
		
		#ToLvl1
		var play_rect_l_1 = level_1.shape.get_rect()
		play_rect_l_1.position += level_1.position 
		if play_rect_l_1.has_point(mouse_pos) and !level_1.disabled:
			level_1.disabled = true
			map.to_shop_1 = true
			map.to_level_1 = false
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/niveau_1.tscn")
		
		#To shop 1 (top side)
		var play_rect_b_1_1 = b_1_1.shape.get_rect()
		play_rect_b_1_1.position += b_1_1.position 
		if play_rect_b_1_1.has_point(mouse_pos) && !b_1_1.disabled :
			b_1_1.disabled = true
			b_1_2.disabled = true
			b_1_3.disabled = true
			map.to_level2 = true
			map.to_shop_1 = false
			map.side = "top"
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/interNiveau.tscn")
			
		#To shop 1 (mid side)
		var play_rect_b_1_2 = b_1_2.shape.get_rect()
		play_rect_b_1_2.position += b_1_2.position 
		if play_rect_b_1_2.has_point(mouse_pos) && !b_1_2.disabled :
			b_1_1.disabled = true
			b_1_2.disabled = true
			b_1_3.disabled = true
			map.to_level2 = true
			map.to_shop_1 = false
			map.side="mid"
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/interNiveau.tscn")
		
		#To shop 1 (bot side)
		var play_rect_b_1_3 = b_1_3.shape.get_rect()
		play_rect_b_1_3.position += b_1_3.position 
		if play_rect_b_1_3.has_point(mouse_pos) && !b_1_3.disabled :
			b_1_1.disabled = true
			b_1_2.disabled = true
			b_1_3.disabled = true
			map.to_level2 = true
			map.to_shop_1 = false
			map.side="bot"
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/interNiveau.tscn")
			
		#To level 2 (top side)
		var play_rect_l_2_1 = level_2_1.shape.get_rect()
		play_rect_l_2_1.position += level_2_1.position 
		if play_rect_l_2_1.has_point(mouse_pos) and !level_2_1.disabled and map.to_level2:
			level_2_1.disabled = true
			map.to_shop_2 = true
			map.to_level2 = false
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/niveau_2.tscn")
		
		#To level 2 (mid side)
		var play_rect_l_2_2 = level_2_2.shape.get_rect()
		play_rect_l_2_2.position += level_2_2.position 
		if play_rect_l_2_2.has_point(mouse_pos) and !level_2_2.disabled and map.to_level2:
			level_2_2.disabled = true
			map.to_shop_2 = true
			map.to_level2 = false
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/niveau_2.tscn")
		
		#To level 2 (bot side)	
		var play_rect_l_2_3 = level_2_3.shape.get_rect()
		play_rect_l_2_3.position += level_2_3.position 
		if play_rect_l_2_3.has_point(mouse_pos) and !level_2_3.disabled and map.to_level2:
			level_2_3.disabled = true
			map.to_shop_2 = true
			map.to_level2 = false
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/niveau_2.tscn")
		
		#To shop 2 (top side)
		var play_rect_b_2_1 = b_2_1.shape.get_rect()
		play_rect_b_2_1.position += b_2_1.position 
		if play_rect_b_2_1.has_point(mouse_pos) and !b_2_1.disabled and map.to_shop_2 :
			b_2_1.disabled = true
			map.to_level_3 = true
			map.to_shop_2 = false
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/interNiveau.tscn")
			
		#To shop 2 (mid side)
		var play_rect_b_2_2 = b_2_2.shape.get_rect()
		play_rect_b_2_2.position += b_2_2.position 
		if play_rect_b_2_2.has_point(mouse_pos) and !b_2_2.disabled and map.to_shop_2 :
			b_2_2.disabled = true
			map.to_level_3 = true
			map.to_shop_2 = false
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/interNiveau.tscn")
		#To shop 2 (bot side)
		var play_rect_b_2_3 = b_2_3.shape.get_rect()
		play_rect_b_2_3.position += b_2_3.position 
		if play_rect_b_2_3.has_point(mouse_pos) and !b_2_3.disabled and map.to_shop_2:
			b_2_3.disabled = true
			map.to_level_3 = true
			map.to_shop_2 = false
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/interNiveau.tscn")
		
		#To level 3
		var play_rect_l_3 = level_3.shape.get_rect()
		play_rect_l_3.position += level_3.position 
		if play_rect_l_3.has_point(mouse_pos) && !level_3.disabled and map.to_level_3 :
			level_3.disabled = true
			map.to_level_3 = false
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/level-boss.tscn")
		
func next_level() -> void:
	if map.to_level_1:
		level_1.disabled = false
	elif map.to_shop_1:
		b_1_1.disabled = false
		b_1_2.disabled = false
		b_1_3.disabled = false 
	elif map.to_level2:
		restriction()
	elif map.to_shop_2:
		restriction()	
	elif map.to_level_3:
		level_3.disabled = false
		
func restriction() -> void:
	if map.side == "top":
		level_2_1.disabled = false
		b_2_1.disabled = false
	elif map.side == "mid":
		level_2_2.disabled = false
		b_2_2.disabled = false
	elif map.side == "bot":
		level_2_3.disabled = false
		b_2_3.disabled = false	
