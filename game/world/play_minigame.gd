extends Area2D

export(String) var game_name
export(PackedScene) var minigame_scene
var is_complete = false
signal play_minigame

func interact():
	if not is_complete:
		emit_signal("play_minigame", self)

func win():
	$CollisionShape2D.disabled = true
	# also change sprite