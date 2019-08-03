extends RigidBody2D

signal cleaned_up

func _on_area_area_entered(area):
	if area.is_in_group("trash"):
		queue_free()
		emit_signal("cleaned_up")
	
