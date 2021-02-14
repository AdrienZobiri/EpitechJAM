extends Node2D

export var playerSpeed = 200
var screen_size
var isVisible
var isDancing
var timer
var timerGood

const creditsScene = preload("res://Scenes/Credits.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/SoundMusic".stop()
	$"/root/SoundWin".play()
	screen_size = get_viewport_rect().size
	isVisible = true
	isDancing = false
	timerGood = false
	timer = 0.0
	$MonkiFlip.visible = false
	$MonkiFlip.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2(0, 0)
	
	if $Player.position.x < $Singe.position.x && isVisible:
		velocity.x += 1
		$Player/AnimatedSprite.play()
		velocity = velocity.normalized() * playerSpeed
		$Player.position += velocity * delta
	elif isVisible:
		$Player.visible = false
		$Singe/AnimatedSprite.animation = "move"
		$Singe/AnimatedSprite.frame = 0
		isVisible = false
	elif $Player.position.x < 350 && !isDancing:
		velocity.x += 1
		velocity = velocity.normalized() * playerSpeed
		$Player.position += velocity * delta
		$Singe.position += velocity * delta
	elif !isDancing:
		isDancing = true
		$Singe/AnimatedSprite.animation = "dance"
		$Singe/AnimatedSprite.frame = 0
		$Singe/AnimatedSprite.play()
	elif isDancing && round(timer) < 5:
		timer += delta
	elif round(timer) >= 5 && !timerGood:
		timerGood = true
		$"/root/SoundWin".stop()
		$MonkiFlip.visible = true
		$MonkiFlip.play()
	elif timerGood && !$MonkiFlip.is_playing():
		$"/root/SoundWin".play()
		get_tree().change_scene("res://scenes/Credits.tscn")
