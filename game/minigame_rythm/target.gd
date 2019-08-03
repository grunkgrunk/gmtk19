extends Area2D

signal win

onready var correct_num = get_node("../notes").get_child_count()
var curr_num = 0
onready var startpos = position
var speed = 10
var canhit = false
var done = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
		canhit = false

