extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal done

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("done",self,"is_done")
	$lineedit.connect("text_entered",self,"enter_pressed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func enter_pressed(text):
	if text == "qgs66ztv":
		emit_signal("done")
func is_done():
	print("is done indeed")