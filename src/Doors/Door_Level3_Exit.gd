extends StaticBody2D

var door_lock_text = preload("res://assets/tileset/big_red_doors.png")
var door_unlock_text = preload("res://assets/tileset/green_doors.png")
onready var door_sprite = get_node("Sprite")
var is_open = false
var in_door_range = false

func _process(delta):
	if is_open:
		if (get_node("Area2D/EnterCollision")):
			get_node("Area2D/EnterCollision").set_disabled(false)
		door_sprite.set_texture(door_unlock_text)
		if Input.is_action_just_pressed("Interact") && in_door_range:
			get_tree().change_scene("res://scenes/Level4.tscn")
	else:
		door_sprite.set_texture(door_lock_text)
		if (get_node("Area2D/EnterCollision")):
			get_node("Area2D/EnterCollision").set_disabled(false)
