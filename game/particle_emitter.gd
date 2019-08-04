extends Node2D

export(PackedScene) var particle

var to_emit = 0

func _ready():
	#emit(600)
	pass

func _on_timer_timeout():
	for i in range(20):
		if to_emit > 0:
			add_child(particle.instance())
			to_emit -= 1
		else:
			$timer.stop()


func emit(num):
	to_emit = num
	$timer.start()
	
	
	