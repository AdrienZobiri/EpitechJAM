extends KinematicBody2D

export var speed = 400
var screen_size
signal hit
var pos

onready var rayCast = get_node("RayCast2D")

onready var ctrl_z_Sound = get_node("Node/CtrlZ")
onready var reset_Sound = get_node("Node2/Reset")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Main.set("player", self)
	pos = position
	screen_size = get_viewport_rect().size
	$".".global_position = Vector2(pos.x, pos.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.frame = 0
		$AnimatedSprite.stop()
	# position += velocity * delta
	move_and_slide(velocity)
	
	if velocity.x > 0:
		$AnimatedSprite.animation = "walkRight"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite.animation = "walkLeft"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = false
	elif velocity.y > 0:
		$AnimatedSprite.animation = "walkDown"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = false
	elif velocity.y < 0:
		$AnimatedSprite.animation = "walkUp"
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.flip_v = false
	else:
		$AnimatedSprite.animation = "stand"
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.flip_v = false
	
	if Input.is_action_just_pressed("Reset"):
		$".".global_position = Vector2(pos.x, pos.y)
		ctrl_z_Sound.play()
	if Input.is_action_just_pressed("Restart"):
		reset_Sound.play()
		yield(get_tree().create_timer(1.2), "timeout")
		get_tree().reload_current_scene()

func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

func _on_Area2D_area_entered(area):
	if area.is_in_group("Buttons"):
		area.get_parent().get_node("Label").visible = true
		area.get_parent().in_button_range = true
	if area.is_in_group("ExitDoor") && area.get_parent().button.is_button_active:
		area.get_parent().get_node("../Label").visible = true
		area.get_parent().in_door_range = true
	if area.is_in_group("Level3_ExitDoor"):
		if (area.get_parent().in_door_range):
			area.get_parent().get_node("../Label").visible = true
		area.get_parent().in_door_range = true

func _on_Area2D_area_exited(area):
	if area.is_in_group("Buttons"):
		area.get_parent().get_node("Label").visible = false
		area.get_parent().in_button_range = false
	if area.is_in_group("ExitDoor") && area.get_parent().button.is_button_active:
		area.get_parent().get_node("../Label").visible = false
		area.get_parent().in_door_range = false
	if area.is_in_group("Level3_ExitDoor"):
		area.get_parent().get_node("../Label").visible = false
		area.get_parent().in_door_range = false
