extends Sprite

onready var door1 = get_node("../../../Doors/door4/Door")
onready var init_button = get_node("../../Init/Button")

onready var buttonSound = get_node("../../../ButtonSound")

var button_active_text = preload("res://assets/tileset/yellow_led.png")
var button_inactive_text = preload("res://assets/tileset/switch_off.png")
var is_button_active = false
var in_button_range = false

func _physics_process(delta):
	if is_button_active == true:
		set_texture(button_active_text)
		get_node("Label").visible = false
	elif in_button_range && Input.is_action_just_pressed("Interact"):
		buttonSound.play()
		is_button_active = true
		door1.is_open = false
		if init_button.iterator == 3:
			init_button.iterator += 1
		else:
			init_button.visible = false
			init_button.get_node("Area2D/CollisionShape2D").set_disabled(true)
			init_button.get_node("HitBox/CollisionShape2D").set_disabled(true)
