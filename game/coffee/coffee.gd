extends Area2D

var coffee_done = false

func interact():
	$timer.start()

func _on_timer_timeout():
	coffee_done = true
	# play sound
	
