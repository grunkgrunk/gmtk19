extends Node2D

func _ready():
	for o in get_children():
		GLOBAL.minigame_progress[o.game_name] = false
		

