extends Node

onready var button = get_node("/root/Level3/Buttons/Troll/Button")
onready var sprite = get_node("void")
onready var collider = get_node("StaticBody2D/CollisionShape2D")

func _process(delta):
	if button.is_button_active:
		sprite.visible = true
		collider.set_disabled(false)
	else:
		sprite.visible = false
		collider.set_disabled(true)
