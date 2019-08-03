extends Area2D

var is_on = false

func interact():
	if is_on:
		return
	$tween.interpolate_property($black, 
	"modulate", Color(1,1,1,1),Color(1,1,1,0), 1,Tween.TRANS_QUAD, 
	Tween.EASE_IN_OUT)
	$tween.start()
	is_on = true

