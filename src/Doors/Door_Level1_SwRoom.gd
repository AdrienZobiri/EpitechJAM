extends StaticBody2D

var door_lock_text = preload("res://assets/tileset/red_doors.png")
var door_unlock_text = preload("res://assets/tileset/open_door.png")
var ctrlz_done = false
var ctrlz_display = true
onready var door_sprite = get_node("Sprite")
onready var button = get_node("../../../Buttons/Sw_Room/Button")

func _process(delta):
	if !button.is_button_active:
		door_sprite.set_texture(door_unlock_text)
		if (get_node("EnterCollision")):
			get_node("EnterCollision").set_disabled(true)
	else:
		door_sprite.set_texture(door_lock_text)
		if (get_node("EnterCollision")):
			get_node("EnterCollision").set_disabled(false)
		if Input.is_action_pressed("Reset"):
			ctrlz_display = false
			get_node("../Label").visible = false
		if (!ctrlz_done && ctrlz_display):
			ctrlz_done = true
			get_node("../Label").visible = true
