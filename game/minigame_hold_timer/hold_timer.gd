extends Sprite

signal win
var hold_time = 1.5
var curr_time = 0
var threshold = 0.1
var startpos

# Called when the node enters the scene tree for the first time.
func _ready():
	startpos = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(curr_time > hold_time+threshold) or (Input.is_action_just_pressed("ui_down")):
		curr_time = 0
	if(Input.is_action_pressed("ui_down")):
		curr_time += delta
	if(Input.is_action_just_released("ui_down")):
		if(abs(curr_time-hold_time)<threshold):
			emit_signal("win")
			
	var p = startpos
	p.y -= curr_time*200
	position = p
	if(abs(curr_time-hold_time)<threshold):
		modulate = Color(0,1,0,1)
	else:
		print(curr_time)
		modulate = Color(1,1,1,1)
