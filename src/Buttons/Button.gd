extends Sprite

var button_active_text = preload("res://assets/tileset/switch_on.png")
var button_inactive_text = preload("res://assets/tileset/switch_off.png")
var is_button_active = false
var in_button_range = false

func _physics_process(delta):
	if is_button_active == true:
		set_texture(button_active_text)
		get_node("Label").visible = false
	else:
		set_texture(button_inactive_text)
	if in_button_range && Input.is_action_just_pressed("Interact"):
			is_button_active = true
