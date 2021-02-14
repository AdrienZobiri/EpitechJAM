extends Node2D

export var speed = 200

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/SoundMusic".stop()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.position.y -= 0.5
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
