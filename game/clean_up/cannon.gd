extends Position2D
signal fired
export(PackedScene) var bullet

var up_rot = 90
var down_rot = 20
var can_shoot = true
var kick_anim_start = false

onready var start_pos = position

onready var from = $sprite/from
onready var to = $sprite/to

func _ready():
	rotation_degrees = up_rot
	$tween.connect("tween_completed", self, "rot_complete")
	down()

func up():
	$tween.interpolate_property(self, "rotation_degrees", rotation_degrees, up_rot, 1,Tween.TRANS_QUAD,Tween.EASE_IN_OUT,0.4)
	$tween.start()

func down():
	$tween.interpolate_property(self, "rotation_degrees", rotation_degrees, down_rot, 1,Tween.TRANS_QUAD,Tween.EASE_IN_OUT,0.4)
	$tween.start()

func rot_complete(a,b):
	print(rotation)
	if rotation_degrees == up_rot:
		down()
	if rotation_degrees == down_rot:
		up()

func _input(event):
	if not can_shoot:
		return
	if event is InputEventKey and event.pressed:
		if event.scancode != KEY_ESCAPE:
			var a = bullet.instance()
			a.global_rotation = $sprite/to_kick.global_rotation
			a.position = $sprite/to_kick.global_position
			var dir = (to.global_position - from.global_position).normalized()
			var impulse = dir * 2000
			a.apply_central_impulse(impulse)
			emit_signal("fired", a)
			can_shoot = false
			$reload_timer.start()
			$sprite/to_kick.hide()
			kick_anim(dir)
			
			
func _on_reload_timer_timeout():
	can_shoot = true
	$sprite/to_kick.show()
	
func kick_anim(dir):
	kick_anim_start = true
	$kick_tween.interpolate_property(self, "position", start_pos, start_pos + dir * 200, 0.1, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT) 
	$kick_tween.start()

func _on_tween_tween_completed(object, key):
	if kick_anim_start:
		$kick_tween.interpolate_property(self, "position", position, start_pos, 1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT, 0.5)
		$kick_tween.start()
		kick_anim_start = false
