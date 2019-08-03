extends Node2D

onready var minigame = $minigame_layer/game
onready var player = $room/player
var curr_game = null
var is_game_over = false

func _ready():
	for r in $room/minigames.get_children():
		r.connect("play_minigame", self, "on_play_minigame")

func on_play_minigame(game):
	curr_game = game
	var inst = game.minigame_scene.instance()
	minigame.add_child(inst)
	inst.connect("win", self, "on_minigame_win")
	player.can_move = false

func return_to_room():
	player.can_move = true
	for a in minigame.get_children():
		a.queue_free()

func on_minigame_win():
	return_to_room()
	curr_game.win()
	
func _on_timer_timeout():
	$game_over.show()
