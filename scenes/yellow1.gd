extends Area2D

func _ready():
	pass

func _on_yellow1_body_shape_entered(body_id, body, body_shape, local_shape):
	var player = Main.get("player")
	player.global_position = get_parent().get_node("yellow2").global_position


func _on_yellow2_body_shape_entered(body_id, body, body_shape, local_shape):
	var player = Main.get("player")
	player.global_position = get_parent().get_node("yellow1").global_position