extends AnimatedSprite

signal win

export var correct_list = [0,0,1,1,0,1,0,1,0,0]
export var how_far = 0
onready var startpos = position
var height = 20

signal won

func _ready():
	set_process_input(true) 

func _input(ev):
	if(how_far >= len(correct_list)):
		return
	if ev is InputEventKey and ev.pressed == true:
		var way = 2

		if Input.is_key_pressed(KEY_LEFT):
			way = 0

		elif Input.is_key_pressed(KEY_RIGHT):
			way = 1

		
		if correct_list[how_far] == way:
			how_far += 1
			
			if(way == 0):
				$anim.play("left")
			else:
				$anim.play("right")
			if(how_far >= len(correct_list)):
				emit_signal('win')

		elif way != 2:
			$anim.play("wrong")
			how_far = 0
			position = startpos
		frame = how_far

