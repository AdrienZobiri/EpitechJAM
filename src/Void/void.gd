extends Sprite

onready var button = get_node("/root/Node2D/Buttons/Se_Room/Button")

func _process(delta):
	if button.is_button_active:
		visible = true
		get_node("../CollisionShape2D").set_disabled(false)
	else:
		visible = false
		get_node("../CollisionShape2D").set_disabled(true)
