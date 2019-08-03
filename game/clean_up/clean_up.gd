extends Node2D

signal win

func _on_cannon_fired(a):
	add_child(a)
	a.connect("cleaned_up", self, "on_cleaned")

func on_cleaned():
	emit_signal("win")
	$hooray.show()
