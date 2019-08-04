extends Node2D

onready var done = $done
onready var label = $label

func write(text,complete):
	label.text = text
	if(complete):
		done.frame = 1

