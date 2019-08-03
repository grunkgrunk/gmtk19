extends Position2D
signal fired
export(PackedScene) var bullet

var up_rot = 10
var down_rot = 80
var can_shoot = true

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
			a.position = $muzzle.global_position
			var dir = Vector2(0,-1).rotated(rotation) * 1200
			a.apply_central_impulse(dir)
			emit_signal("fired", a)
			can_shoot = false
			$reload_timer.start()

func _on_reload_timer_timeout():
	can_shoot = true