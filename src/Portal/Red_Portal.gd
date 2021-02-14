extends Area2D

var is_pressed = false

func _on_red1_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("Player"):
		var player = Main.get("player")
		if is_pressed == false:
			player.global_position = get_parent().get_node("red2").global_position
		else:
			player.global_position = get_parent().get_node("red3").global_position


func _on_red2_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("Player"):
		var player = Main.get("player")
		player.global_position = get_parent().get_node("red1").global_position


func _on_red3_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("Player"):
		var player = Main.get("player")
		player.global_position = get_parent().get_node("red1").global_position
