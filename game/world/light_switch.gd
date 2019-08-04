extends Area2D

var is_on = false

signal lights_on

func interact():
	if is_on:
		return
	$CollisionShape2D/anim.frame = 1
	$tween.interpolate_property($black, 
	"modulate", Color(1,1,1,1),Color(1,1,1,0), 1,Tween.TRANS_QUAD, 
	Tween.EASE_IN_OUT)
	$tween.start()
	is_on = true
	emit_signal("lights_on")
