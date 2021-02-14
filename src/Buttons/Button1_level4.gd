extends Sprite

onready var door = get_node("../../../Exit/Door")
onready var purple1 = get_node("../../../Portal/purple1")
onready var purple2 = get_node("../../../Portal/purple2")
onready var buttonSound = get_node("../../../Node/ButtonSound")

var button_active_text = preload("res://assets/tileset/switch_on.png")
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
		door.is_open = true
		purple1.get_node("AnimatedSprite").visible = false
		purple1.get_node("CollisionShape2D").set_disabled(true)
		purple2.get_node("AnimatedSprite").visible = false
		purple2.get_node("CollisionShape2D").set_disabled(true)
