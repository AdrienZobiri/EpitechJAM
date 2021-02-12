extends MarginContainer

const firstScene = preload("res://Scenes/All.tscn")

onready var selectorOne = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selectorTwo = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selectorThree = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector

var currentSelection = 0

func _ready():
	setCurrentSelection(0)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down") and currentSelection < 2:
		currentSelection += 1
		setCurrentSelection(currentSelection)
	elif Input.is_action_just_pressed("ui_up") and currentSelection > 0:
		currentSelection -= 1
		setCurrentSelection(currentSelection)
	elif Input.is_action_just_pressed("ui_accept"):
		handleSelection(currentSelection)

func handleSelection(_currentSelection):
	if _currentSelection == 0:
		get_parent().add_child(firstScene.instance())
		queue_free()
	elif _currentSelection == 1:
		print("Add Options !")
	elif _currentSelection == 2:
		get_tree().quit()

func setCurrentSelection(_currentSelection):
	selectorOne.text = ""
	selectorTwo.text = ""
	selectorThree.text = ""
	if _currentSelection == 0:
		selectorOne.text = "> "
	elif _currentSelection == 1:
		selectorTwo.text = "> "
	elif _currentSelection == 2:
		selectorThree.text = "> "
