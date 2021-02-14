extends Sprite

onready var door1 = get_node("../../../Doors/door1/Door")
onready var door2 = get_node("../../../Doors/door2/Door")
onready var door3 = get_node("../../../Doors/door3/Door")
onready var door4 = get_node("../../../Doors/door4/Door")
onready var door5 = get_node("../../../Doors/door5/Door")
onready var door6 = get_node("../../../Doors/door6/Door")
onready var door7 = get_node("../../../Doors/door7/Door")
onready var door8 = get_node("../../../Doors/door8/Door")
onready var door_exit = get_node("../../../Doors/Exit/Door")

onready var buttonSound = get_node("../../../ButtonSound")

var button_active_text = preload("res://assets/tileset/switch_on.png")
var button_inactive_text = preload("res://assets/tileset/switch_off.png")
var is_button_active = false
var in_button_range = false

var array_color = ["Orange", "Vert", "Rouge", "Jaune", "Magenta", "Cyan", "Rose", "Bleu"]
var iterator = 0

func _physics_process(delta):
	if is_button_active == true:
		set_texture(button_active_text)
		get_node("Label").visible = false
	if in_button_range && Input.is_action_just_pressed("Interact"):
		buttonSound.play()
		is_button_active = true
		door1.is_open = true
		door2.is_open = true
		door3.is_open = true
		door4.is_open = true
		door5.is_open = true
		door6.is_open = true
		door7.is_open = true
		door8.is_open = true
	else:
		is_button_active = false
	if iterator == 8:
		door_exit.is_open = true
