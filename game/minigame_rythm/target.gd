extends Area2D

signal win

onready var correct_num = get_node("../notes").get_child_count()
onready var audio = $audio

var curr_num = 0
onready var startpos = position
var speed = 9.5
var canhit = false
var done = false
# Called when the node enters the scene tree for the first time.
func _ready():
	audio.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(done):
		return
	position += Vector2(speed,0)
	if(Input.is_action_just_pressed("ui_down")):
		if(canhit):
			curr_num += 1
			canhit = false
		else: 
			audio.play()
			position = startpos
			curr_num = 0
	if(curr_num >= correct_num):
		done = true
		emit_signal("win")
		

	


func _on_target_area_entered(area):
	if(area.is_in_group("note")):
		canhit = true



func _on_target_area_exited(area):
	if(area.is_in_group("note")):
		if(canhit):
			canhit = false
			
		

