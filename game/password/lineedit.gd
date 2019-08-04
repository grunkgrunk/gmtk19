extends LineEdit

func _ready():
	var new_style = StyleBoxFlat.new()
	new_style.set_bg_color(Color(0,0,0,0))    # green
	set('custom_styles/normal', new_style) # panel is now green