extends Area2D

signal win
onready var notes = get_node("../notes")
onready var correct_num = get_node("../notes").get_child_count()
onready var audio = $audio
onready var wrong = $wrong
var canmove = false
var curr_num = 0
onready var startpos = notes.position
var speed = 700
var canhit = false
var done = false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	begin()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(done):
		return
	if(!canmove):
		return
	get_node("../notes").position += Vector2(0,speed*delta)
	if(Input.is_action_just_pressed("ui_down")):
		if(canhit):
			curr_num += 1
			canhit = false
		else: 
			begin()
			curr_num = 0
	if(curr_num >= correct_num):
		done = true
		emit_signal("win")
		

	


func _on_target_area_entered(area):
	if(area.is_in_group("note")):
		canhit = true


func begin():
	audio.play()
	$timer.wait_time = AudioServer.ti + AudioServer.get_output_latency()
	
func _on_target_area_exited(area):
	if(area.is_in_group("note")):
		if(canhit):
			canhit = false
			wrong.play()
			
		



func _on_timer_timeout():
	notes.position = startpos
	canmove = true
