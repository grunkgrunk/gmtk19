extends Camera2D

func _on_cannon_fired(a):
	$animation.current_animation = "camera_pan"
	$timer.start()

	


func _on_timer_timeout():
	$animation.current_animation = "return_cam"
