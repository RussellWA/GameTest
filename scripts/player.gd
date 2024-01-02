extends CharacterBody2D

const speed = 70

var curr_dir = "none"

func _ready():
	$AnimatedSprite2D.play("idle_front")

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	
	if Input.is_action_pressed("left"):
		curr_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	
	elif Input.is_action_pressed("right"):
		curr_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	
	elif Input.is_action_pressed("up"):
		curr_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	
	elif Input.is_action_pressed("down"):
		curr_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

func play_anim(movement):
	var dir = curr_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk_side")
		elif movement == 0:
			anim.play("idle_side")
	
	elif dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("walk_side")
		elif movement == 0:
			anim.play("idle_side")
	
	elif dir == "up":
		if movement == 1:
			anim.play("walk_back")
		elif movement == 0:
			anim.play("idle_back")
	
	elif dir == "down":
		if movement == 1:
			anim.play("walk_front")
		elif movement == 0:
			anim.play("idle_front")

