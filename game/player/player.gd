extends KinematicBody2D

var tileSize = 16
var can_move = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not can_move:
		return
	var dir = Vector2()
	if Input.is_action_just_pressed("ui_up"):
		dir.y = -1
	if Input.is_action_just_pressed("ui_down"):
		dir.y = 1
	if Input.is_action_just_pressed("ui_left"):
		dir.x = -1
	if Input.is_action_just_pressed("ui_right"):
		dir.x = 1
	move_and_collide(dir*tileSize)
	
	if Input.is_action_just_pressed("interact"):
		for d in $area.get_overlapping_areas():
			if d.is_in_group("interactable"):
				d.owner.interact()
