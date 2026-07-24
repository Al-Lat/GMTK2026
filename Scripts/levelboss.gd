extends Node2D # Remplace par le type exact de LevelBoss si ce n'est pas Node2D

# Variables que tu pourras modifier directement dans l'Inspecteur
@export var joueur: Node2D
@export var nouvelle_texture_ciel: Texture2D
@export var profondeur_limite: float = 300

# On récupère automatiquement ton Sprite2D grâce à ton architecture
@onready var sky_sprite: Sprite2D = $Background/Sky/Sprite2D

var ciel_deja_change: bool = false

func _process(_delta: float) -> void:
	# Si le joueur n'est pas assigné ou que le ciel a déjà changé, on ne fait rien
	if not joueur or ciel_deja_change:
		return
		
	# Si le joueur descend en dessous de la limite Y
	if joueur.global_position.y > profondeur_limite:
		changer_le_ciel()

func changer_le_ciel() -> void:
	if nouvelle_texture_ciel:
		sky_sprite.texture = nouvelle_texture_ciel
		ciel_deja_change = true
		print("Le joueur est descendu : le ciel a changé !")
