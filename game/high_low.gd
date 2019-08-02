extends Label


var correct_number = 6572
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Guess my number! It is between 1 and 10000"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_LineEdit_text_entered(new_text):
	var num = int(new_text)
	
	if(num == correct_number):
		text = "Yes! How did you know?!"
	elif(num == 0):
		text = "Nonono " + new_text + " is not the correct number... it is not even a number..."
	else:
		text = "That is not correct. "
		if(num < correct_number):
			text += "My number is larger!"
		else:
			text += "My number is smaller!"
			