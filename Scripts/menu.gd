extends Node2D

@onready var animated_play = $playSprite
@onready var animated_quit = $quitSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_play.play("default")
	animated_quit.play("default")
	MapSingleton.reset()
	LifeIsLife.reset()

func _process(delta: float) -> void:
	pass

# On intercepte toutes les entrées de la souris avec la fonction _input
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		var mouse_pos = get_local_mouse_position()
		
		var play_rect = $play.shape.get_rect()
		play_rect.position += $play.position 
		
		if play_rect.has_point(mouse_pos):
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/Cinematique/scene_debut.tscn")
			return
			
		var quit_rect = $quit.shape.get_rect()
		quit_rect.position += $quit.position 
		
		if quit_rect.has_point(mouse_pos):
			print("Clic sur Quit !")
			get_tree().quit()
