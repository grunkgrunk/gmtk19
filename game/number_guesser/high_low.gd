extends Node2D

signal win
var correct_number = 6572
onready var label = $high_low
var new_text = ""
func _ready():
	label.text = "Guess my number! It is between 1 and 10000"
	$edit.connect("text_entered", self, "_on_LineEdit_text_entered")
	$edit.grab_focus()
	
	var new_style = StyleBoxFlat.new()
	new_style.set_bg_color(Color(0,0,0,0))    # green
	$edit.set('custom_styles/normal', new_style) # panel is now green

func _on_LineEdit_text_entered(_new_text):
	label.text = "..."
	$timer.start()
	new_text = _new_text

func _on_timer_timeout():
	var num = int(new_text)
	if(num == correct_number):
		label.text = "Yes! How did you know?!"
		emit_signal("win")
	elif(num == 0):
		label.text = "Nonono " + new_text + " is not the correct number... it is not even a number..."
	else:
		label.text = "Nono " + str(num) + " is not correct. "
		if(num < correct_number):
			label.text += "My number is larger!"
		else:
			label.text += "My number is smaller!"
