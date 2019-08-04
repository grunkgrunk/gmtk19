extends AnimatedSprite

signal win
var hold_time = 1.5
var curr_time = 0
var threshold = 0.1
var startpos
onready var label = $Node/label

export var canhold = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$stream.hide()
	startpos = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$stream.hide()
	label.hide()
	if !canhold:
		label.show()
		return
	frame = 0
	if(curr_time > hold_time+threshold):
		curr_time = 0
		frame = 2
		canhold = false
		label.text = "Too much coffee!"
		$anim.play("new_cup")
	if(Input.is_action_just_pressed("ui_down")):
		curr_time = 0
	if(Input.is_action_pressed("ui_down")):
		$stream.show()
		curr_time += delta
	if(Input.is_action_just_released("ui_down")):
		if(abs(curr_time-hold_time)<threshold):
			label.text = "Just perfect!"
			canhold = false
			emit_signal("win")
		else:
			curr_time = 0
			label.text = "Not enough coffee!"
			$anim.play("new_cup")
	#var p = startpos
	#p.y -= curr_time*200
	#position = p
	if(abs(curr_time-hold_time)<threshold):
		#modulate = Color(0,1,0,1)
		frame = 1
	else:
		pass
		#modulate = Color(1,1,1,1)
