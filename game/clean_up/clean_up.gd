extends Node2D

func _on_cannon_fired(a):
	add_child(a)
	a.connect("cleaned_up", self, "on_cleaned")

func on_cleaned():
	emit_signal("done")
	$hooray.show()
