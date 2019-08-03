extends Node2D

onready var minigame = $minigame_layer/game
onready var player = $room/player
onready var blur = $minigame_layer/blur_shader.material
var curr_game = null
var is_game_over = false
var blur_amount = 1.5
var blur_time = 0.5

func _ready():
	for r in $room/minigames.get_children():
		r.connect("play_minigame", self, "on_play_minigame")
	

func on_play_minigame(game):
	minigame.modulate = Color(1,1,1,0)
	$blur_tween.interpolate_property(blur,"shader_param/amount",0,blur_amount,blur_time,Tween.TRANS_QUAD,Tween.EASE_IN_OUT,0)
	$blur_tween.start()
	$minigame_tween.interpolate_property(minigame,"modulate", Color(1,1,1,0),Color(1,1,1,1), blur_time,Tween.TRANS_QUAD, 
	Tween.EASE_IN_OUT)
	$minigame_tween.start()
	curr_game = game
	var inst = game.minigame_scene.instance()
	minigame.add_child(inst)
	inst.connect("win", self, "on_minigame_win")
	player.can_move = false

func return_to_room():
	$blur_tween.interpolate_property(blur,"shader_param/amount",blur_amount,0,blur_time,Tween.TRANS_QUAD,Tween.EASE_IN_OUT,0)
	$blur_tween.start()
	$minigame_tween.interpolate_property(minigame,"modulate", Color(1,1,1,1),Color(1,1,1,0), blur_time,Tween.TRANS_QUAD, 
	Tween.EASE_IN_OUT)
	$minigame_tween.start()
	player.can_move = true
	for a in minigame.get_children():
		a.queue_free()

func on_minigame_win():
	return_to_room()
	curr_game.win()
	
func _on_timer_timeout():
	$game_over.show()

