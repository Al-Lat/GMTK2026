extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$the_world.text = str(0)
	$speed_ressources.text = str(0)
	$strength_ressources.text = str(0)
	$attack_speed_ressources.text = str(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update_time() -> void:
	$the_world.text = str($life_is_life.temps)

func update_speed() -> void:
	$speed_ressources.text = str($speedrun.we_are_speed)

func update_strength() -> void:
	$strength_ressources.text = str($kill_them_all.force_pure)

func update_attack_speed() -> void:
	$attack_speed_ressources.text = str($kill_them_fast.force_rapide)
