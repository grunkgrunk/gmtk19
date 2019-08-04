extends CanvasLayer

export(PackedScene) var list

var restart = false
var game_over = false
signal restart
var removelist = []

func _process(delta):
	if(!game_over):
		return
	if(Input.is_action_just_pressed("ui_accept")):
		
		if(!restart):
			list()
		else:
			game_over = false
			for i in removelist:
				i.queue_free()
			removelist = []
			$white.hide()
			emit_signal("restart")
			print("restart")


func endgame():
	game_over = true
	$game_over.show()
	restart = false
	
func list():
	$game_over.hide()
	$white.show()
	restart = true
	var times = 0
	for m in GLOBAL.minigame_progress:
		var i = list.instance()
		removelist.append(i)
		add_child(i)
		i.write(str(m),GLOBAL.minigame_progress[m])
		i.position += Vector2(60,times*78)
		times += 1