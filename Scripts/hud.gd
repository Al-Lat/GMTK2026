extends CanvasLayer

var lifeIsLife = LifeIsLife
var speedrun = Speedrun
var killThemAll = KillThemAll
var killThemFast = KillThemFast

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$the_world.text = str(lifeIsLife.temps)
	$speed_ressources.text = str(speedrun.we_are_speed)
	$strength_ressources.text = str(killThemAll.force_pure)
	$attack_speed_ressources.text = str(killThemFast.force_rapide)
	lifeIsLife.hud = self
	speedrun.hud = self
	killThemAll.hud = self
	killThemFast.hud = self


func update_time() -> void:
	$the_world.text = str(lifeIsLife.temps)

func update_speed() -> void:
	$speed_ressources.text = str(speedrun.we_are_speed)

func update_strength() -> void:
	$strength_ressources.text = str(killThemAll.force_pure)

func update_attack_speed() -> void:
	$attack_speed_ressources.text = str(killThemFast.force_rapide)
