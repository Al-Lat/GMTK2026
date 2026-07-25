extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		var mouse_pos = get_local_mouse_position()
		
		var play_rect = $level1.shape.get_rect()
		play_rect.position += $level1.position 
		
		if play_rect.has_point(mouse_pos):
			print("Clic sur Play !")
			get_tree().change_scene_to_file("res://Scenes/niveau_1.tscn")
