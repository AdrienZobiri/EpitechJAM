extends StaticBody2D

var door_lock_text = preload("res://assets/tileset/red_doors.png")
var door_unlock_text = preload("res://assets/tileset/open_door.png")
onready var door_sprite = get_node("Sprite")
onready var button1 = get_node("../../../Buttons/Sw_Room/Button")
onready var button2 = get_node("../../../Buttons/Ne_Room/Button")

func _process(delta):
	if button2.is_button_active:
		door_sprite.set_texture(door_lock_text)
		if (get_node("EnterCollision")):
			get_node("EnterCollision").set_disabled(false)
	if button1.is_button_active && !button2.is_button_active:
		door_sprite.set_texture(door_unlock_text)
		if (get_node("EnterCollision")):
			get_node("EnterCollision").set_disabled(true)
