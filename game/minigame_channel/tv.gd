extends Node2D

signal win

var correct_channel = 27
var current_channel = 0
onready var tv = $tv
var done = false

var channels = {
	"4": "gun",
	"10": "man",
	"13": "num",
	"16": "alien",
	"20": "dance",
	"27": "fire",
}

func _ready():
	tv.animation = "default"

func _input(event):
	if(done):
		return
	if event is InputEventKey and event.pressed:
		if event.scancode != KEY_ESCAPE:
			$black.show()
			$timer.start()
			current_channel += 1
			if str(current_channel) in channels:
				tv.animation = channels[str(current_channel)]
			else:
				tv.animation = "default"
			if(current_channel == correct_channel):
				done = true
				emit_signal("win")

func _on_timer_timeout():
	$black.hide()
