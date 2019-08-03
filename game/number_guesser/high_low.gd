extends Node2D

signal win
var correct_number = 6572
onready var label = $high_low
func _ready():
	label.text = "Guess my number! It is between 1 and 10000"
	$edit.connect("text_entered", self, "_on_LineEdit_text_entered")
	$edit.grab_focus()

func _on_LineEdit_text_entered(new_text):
	var num = int(new_text)
	
	if(num == correct_number):
		label.text = "Yes! How did you know?!"
		emit_signal("win")
	elif(num == 0):
		label.text = "Nonono " + new_text + " is not the correct number... it is not even a number..."
	else:
		label.text = "That is not correct. "
		if(num < correct_number):
			label.text += "My number is larger!"
		else:
			label.text += "My number is smaller!"
			