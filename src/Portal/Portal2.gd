extends Area2D

onready var button = get_node("../Buttons/Portals/Button")

func _ready():
	pass

func _process(delta):
	if button.is_button_active:
		visible = true
		get_node("CollisionShape2D").set_disabled(false)
	else:
		visible = false
		get_node("CollisionShape2D").set_disabled(true)
