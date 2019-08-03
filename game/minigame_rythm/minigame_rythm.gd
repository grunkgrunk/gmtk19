extends Node2D

signal win

func _ready():
	$target.connect("win", self, "_on_win")

func _on_win():
	emit_signal("win")