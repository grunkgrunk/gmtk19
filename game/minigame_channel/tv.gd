extends Node2D

signal win

var correct_channel = 27
var current_channel = 0
onready var channel = $channel
onready var sound = $sound
onready var label = $Label
var correct_volume = 7
var volume = 0
var done = false

func _process(delta):
	if(done):
		return
	if(Input.is_action_just_pressed("ui_up")):
		current_channel += 1
	if(Input.is_action_just_pressed("ui_down")):
		current_channel -= 1
	if(Input.is_action_just_pressed("ui_left")):
		volume -= 1
	if(Input.is_action_just_pressed("ui_right")):
		volume += 1
	volume = min(max(0,volume),10)
	
	channel.frame = current_channel
	sound.volume_db = volume
	label.text = "volume: " + str(volume) + "\nchannel: " + str(current_channel)
	
	if(current_channel == correct_channel and volume == correct_volume):
		done = true
		emit_signal("win")