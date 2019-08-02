extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = Vector2()
	if Input.is_action_pressed("move_up"):
		dir.y = -1
	if Input.is_action_pressed("move_down"):
		dir.y = 1
	if Input.is_action_pressed("move_left"):
		dir.x = -1
	if Input.is_action_pressed("move_right"):
		dir.x = 1
	move_and_slide(dir.normalized()*speed)
	
	if Input.is_action_just_pressed("interact"):
		for d in $area.get_overlapping_areas():
			if d.is_in_group("interactable"):
				d.interact()
				
	


