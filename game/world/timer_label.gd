extends Label

func _process(delta):
	text = str(floor($timer.time_left))

func _on_timer_timeout():
	pass # Replace with function body.
