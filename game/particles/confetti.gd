extends Node2D

var vel = Vector2()
var acc = Vector2()

func _ready():
	vel = Vector2(1, 0).rotated(rand_range(0, -PI)) * rand_range(100, 300)
	$sprite.frame = randi() % 4
	$tween.interpolate_property($sprite,
	"modulate", Color(1,1,1,1), Color(1,1,1,0), 
	rand_range(1, 2),Tween.TRANS_QUAD, Tween.EASE_IN_OUT, 0.2)
	$tween.start() 

func _process(delta):
	acc += Vector2(0, 3)
	vel += acc
	position += vel * delta
	acc = Vector2() 
	rotation = atan2(vel.y, vel.x) + PI / 2

func _on_tween_tween_completed(object, key):
	queue_free()
