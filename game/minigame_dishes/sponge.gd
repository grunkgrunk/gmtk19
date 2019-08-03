extends Sprite

var center
var radius
var angle 
var speed = 0.1
var num_stains = 7
var num_cleaned = 0
onready var tween = $Tween
var moving = false
# Called when the node enters the scene tree for the first time.
func _ready():
	angle = PI/2
	center = get_parent().position
	radius = (position - center).length()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(moving == true):
		return
	if(num_cleaned >= num_stains):
		return
	if(Input.is_action_pressed("ui_left")):
		angle -= speed
		print(angle)
	if(Input.is_action_pressed("ui_right")):
		angle += speed
	if(Input.is_action_just_pressed("ui_up")):
		wash()
	var pos = Vector2(cos(angle),sin(angle))*radius + center
	position = pos
	

	
func wash():
	moving = true
	print("Wahs")
	var ini = position
	var to_cen = center - position
	var fin = to_cen*2 + position
	tween.interpolate_property(self,'position',ini,fin,0.5,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,0)
	tween.start()
	print(ini,fin)

func _on_Area2D_area_entered(area):
	var s = area.get_parent()
	if(s.is_in_group("stain")):
		num_cleaned += 1
		s.queue_free()
	


func _on_Tween_tween_completed(object, key):
	print("done")
	angle += PI
	moving = false
