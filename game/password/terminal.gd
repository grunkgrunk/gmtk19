extends Node2D

signal win

const password = "correcthorsebatterystaple"

func _ready():
	$label.text = "enter password."
	$lineedit.connect("text_entered",self,"enter_pressed")
	$lineedit.grab_focus()

func enter_pressed(text):
	if text == password:
		$label.text = "welcome, dave!"
		emit_signal("win")
	else:
		$label.text = "wrong password."
		$timer.start()


func _on_timer_timeout():
	$label.text = "enter password:"
	
