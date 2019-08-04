extends KinematicBody2D

var tileSize = 16
var can_move = true
var prev_dir = Vector2()
onready var anim = $img/anim

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
	
	if dir != Vector2():
		if dir != prev_dir:
			if dir.y < 0:
				anim.animation = "up"
			elif dir.y > 0:
				anim.animation = "down"
			
			if dir.x != 0:
				anim.animation = "left"
				anim.flip_h = dir.x > 0
		else:
			anim.frame = (anim.frame + 1) % anim.frames.get_frame_count(anim.animation)
	
		prev_dir = dir
	
	move_and_collide(dir*tileSize)
	
	if Input.is_action_just_pressed("interact"):
		for d in $area.get_overlapping_areas():
			print(d)
			if d.is_in_group("interactable"):
				if d.has_method("interact"):
					d.interact()
				else:
					d.owner.interact()

func shake(duration,frequency,amplitude):
	$cam.shake(duration,frequency,amplitude)
	
func game_over():
	can_move = false