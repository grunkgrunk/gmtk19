extends YSort


func _ready():
	for a in get_tree().get_nodes_in_group("light_object"):
		a.hide()	

func _on_light_switch_lights_on():
	for a in get_tree().get_nodes_in_group("light_object"):
		a.show()
		
