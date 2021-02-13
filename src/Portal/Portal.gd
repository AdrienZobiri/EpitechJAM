extends Area2D

onready var button = get_node("../Buttons/Portals/Button")

func _ready():
	pass

func _on_Portal_body_shape_entered(body_id, body, body_shape, local_shape):
	var player = Main.get("player")
	player.global_position = get_parent().get_node("Portal2").global_position


func _on_Portal2_body_shape_entered(body_id, body, body_shape, local_shape):
	var player = Main.get("player")
	player.global_position = get_parent().get_node("Portal").global_position

func _process(delta):
	if button.is_button_active:
		visible = true
		get_node("CollisionShape2D").set_disabled(false)
	else:
		visible = false
		get_node("CollisionShape2D").set_disabled(true)
