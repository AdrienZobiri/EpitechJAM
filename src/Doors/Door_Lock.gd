extends StaticBody2D

var door_lock_text = preload("res://assets/tileset/red_doors.png")
var door_unlock_text = preload("res://assets/tileset/open_door.png")
onready var door1_sprite = get_node("Sprite")
onready var button = get_node("../../../Buttons/Button")

func _process(delta):
	if !button.is_button_active:
		door1_sprite.set_texture(door_unlock_text)
		if (get_node("EnterCollision")):
			get_node("EnterCollision").set_disabled(true)
	else:
		door1_sprite.set_texture(door_lock_text)
		if (get_node("EnterCollision")):
			get_node("EnterCollision").set_disabled(false)
