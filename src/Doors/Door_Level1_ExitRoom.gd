extends StaticBody2D

var door_lock_text = preload("res://assets/tileset/red_doors.png")
var door_unlock_text = preload("res://assets/tileset/green_doors.png")
onready var door_sprite = get_node("Sprite")
onready var button = get_node("../../../Buttons/Ne_Room/Button")
var in_door_range = false

func _process(delta):
	if !button.is_button_active:
		door_sprite.set_texture(door_lock_text)
		if (get_node("Area2D/EnterCollision")):
			get_node("Area2D/EnterCollision").set_disabled(false)
	else:
		door_sprite.set_texture(door_unlock_text)
