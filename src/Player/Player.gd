extends KinematicBody2D

export var speed = 400
var screen_size
signal hit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
#	hide()


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
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
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


func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
