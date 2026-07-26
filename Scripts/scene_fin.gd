extends Control

@onready var label: RichTextLabel = $RichTextLabel
@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer

var textes_histoire : Array[String] = [
	"Deprived of its leader, Chronos Corp",
	"crumbled in a violent power vacuum",
	"The company brought down all the institutions that it controlled, plunging society into chaos",
	"It's the birth of a new era. One question remains :",
	"What will become of time ?",
	"The Countdown to our fate has begun."
]

var temps_apparition : float = 1.5
var temps_affichage : float = 5.0
var temps_disparition : float = 1.5
var pause_entre_phrases : float = 0.5 

func _ready() -> void:
	LifeIsLife.end_level()
	label.modulate.a = 0.0
	
	if audio_player.stream:
		audio_player.play()

	lancer_cinematique()

func lancer_cinematique() -> void:
	for texte in textes_histoire:
		label.text = texte
		
		var tween_in = create_tween()
		tween_in.tween_property(label, "modulate:a", 1.0, temps_apparition)
		await tween_in.finished
		
		await get_tree().create_timer(temps_affichage).timeout
		
		var tween_out = create_tween()
		tween_out.tween_property(label, "modulate:a", 0.0, temps_disparition)
		await tween_out.finished
		
		await get_tree().create_timer(pause_entre_phrases).timeout

	fin_de_cinematique()

func fin_de_cinematique() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _unhandled_input(event: InputEvent) -> void:
	# Si le joueur appuie sur Espace ou Entrée
	if Input.is_key_pressed(KEY_SPACE) or Input.is_key_pressed(KEY_ENTER):
		fin_de_cinematique()
