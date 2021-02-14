extends Node

onready var button = get_node("/root/Level2/Buttons/Room/Button")
onready var top_sprite = get_node("top")
onready var bot_sprite = get_node("bot")
onready var right_sprite = get_node("right")
onready var top_collider = get_node("StaticBody2D/CollisionShape2D")
onready var bot_collider = get_node("StaticBody2D2/CollisionShape2D2")
onready var right_collider = get_node("StaticBody2D3/CollisionShape2D3")

func _process(delta):
	if button.is_button_active:
		top_sprite.visible = true
		top_collider.set_disabled(false)
		bot_sprite.visible = true
		bot_collider.set_disabled(false)
		right_sprite.visible = true
		right_collider.set_disabled(false)
	else:
		top_sprite.visible = false
		top_collider.set_disabled(true)
		bot_sprite.visible = false
		bot_collider.set_disabled(true)
		right_sprite.visible = false
		right_collider.set_disabled(true)
