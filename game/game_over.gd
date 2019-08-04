extends CanvasLayer

export(PackedScene) var list

var restart = false
var game_over = false
signal restart
var removelist = []

func _ready():
	$modulate.modulate = Color(1,1,1,0)

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
			$Tween.interpolate_property($modulate,"modulate",Color(1,1,1,1),Color(1,1,1,0),0.5,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
			$Tween.start()
			emit_signal("restart")
			print("restart")


func endgame():
	$Tween.interpolate_property($modulate,"modulate",Color(1,1,1,0),Color(1,1,1,1),0.5,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	$Tween.start()
	game_over = true
	$modulate/game_over.show()
	restart = false
	
func list():
	$modulate/game_over.hide()
	restart = true
	var times = 0
	for m in GLOBAL.minigame_progress:
		var i = list.instance()
		removelist.append(i)
		$modulate.add_child(i)
		i.write(str(m),GLOBAL.minigame_progress[m])
		i.position += Vector2(60,times*70)
		times += 1