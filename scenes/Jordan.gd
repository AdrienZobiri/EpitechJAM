extends Sprite

onready var troll_button = get_node("../Buttons/Troll/Button")

func _physics_process(delta):
	if (troll_button.is_button_active):
		visible = true
