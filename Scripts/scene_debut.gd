extends Control

@onready var label: RichTextLabel = $RichTextLabel
@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer

var textes_histoire : Array[String] = [
	"tic, tac, tic, tac, tic, tac",
	"These days, time is far more precious than anything else",
	"Time has become the currency of this world",
	"The fear of death has intensified, it has grown stronger",
	"But before that, we’d… die",
	"But what is death ?",
	"Is it inevitable ?",
	"Is there any way to avoid it ?",
	"awaits",
	"I can do it",
	"These days, weapons are more powerful than ever",
	"I won’t let time get the better of me",
	"I would kill Time itself to live forever",
	"Let the carnage begin",
]

var temps_apparition : float = 1.5
var temps_affichage : float = 3.0
var temps_disparition : float = 1.5
var pause_entre_phrases : float = 0.5 

func _ready() -> void:
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
	# get_tree().change_scene_to_file("res://Scenes/MonJeu.tscn")
	print("Fin de la cinématique !")

func _unhandled_input(event: InputEvent) -> void:
	# Si le joueur appuie sur Espace ou Entrée
	if event.is_action_pressed("ui_accept"):
		fin_de_cinematique()
