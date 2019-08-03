extends Label

func _process(delta):
	text = str(floor($timer.time_left))