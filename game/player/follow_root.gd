extends Node2D

onready var parent = get_node("../")

func _ready():
	set_as_toplevel(true)
	position = parent.position

func _process(delta):
	position = position.linear_interpolate(parent.position, 0.5)