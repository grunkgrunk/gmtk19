extends Node2D

func _ready():
	for o in get_children():
		pass
		GLOBAL.minigame_progress[o.game_name] = false

