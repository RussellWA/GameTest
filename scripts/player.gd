extends CharacterBody2D

const speed = 70

var curr_dir = "none"
var is_mov = 0
var input_vector = Vector2.ZERO

@export var inventory: Inv

func _ready():
	$AnimatedSprite2D.play("idle_front")

func _physics_process(delta):
	move_player()
	face_player()
	play_anim(is_mov)

func move_player(): #Determines the direction the player is moving
	input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	input_vector = input_vector.normalized()
	
	if input_vector:
		velocity = input_vector * speed
	else:
		velocity = input_vector
	move_and_slide() 

func face_player():
	if input_vector == Vector2.ZERO:
		is_mov = 0
	else:
		is_mov = 1

	if input_vector.x != 0 && input_vector.y != 0:
		if input_vector.x > 0 && input_vector.y > 0:
			curr_dir = "downright"
		elif input_vector.x > 0 && input_vector.y < 0:
			curr_dir = "upright"
		elif input_vector.x < 0 && input_vector.y > 0:
			curr_dir = "downleft"
		elif input_vector.x < 0 && input_vector.y < 0:
			curr_dir = "upleft"

	elif input_vector.x != 0 && input_vector.y == 0:
		if input_vector.x > 0:
			curr_dir = "right"
		else:
			curr_dir = "left"

	elif input_vector.y != 0 && input_vector.x == 0:
		if input_vector.y > 0:
			curr_dir = "down"
		else:
			curr_dir = "up"

func play_anim(movement):
	var anim = $AnimatedSprite2D
	
	if curr_dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk_side")
		elif movement == 0:
			anim.play("idle_side")
	
	elif curr_dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("walk_side")
		elif movement == 0:
			anim.play("idle_side")
	
	elif curr_dir == "up":
		if movement == 1:
			anim.play("walk_back")
		elif movement == 0:
			anim.play("idle_back")
	
	elif curr_dir == "down":
		if movement == 1:
			anim.play("walk_front")
		elif movement == 0:
			anim.play("idle_front")

func _on_area_2d_area_entered(area):
	if area.has_method("collect"):
		area.collect(inventory)
