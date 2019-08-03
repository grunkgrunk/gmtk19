extends Node2D

signal win

const password = "correcthorsebatterystaple"

func _ready():
	$lineedit.connect("text_entered",self,"enter_pressed")
	$lineedit.grab_focus()

func enter_pressed(text):
	if text == password:
		emit_signal("win")