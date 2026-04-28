extends CharacterBody2D

# Variaveis
var maxSpeed = 700
var maxSpeedFloat = 1.5
var accel = 1000
var accelFloat = 1
var decel = 500
var decelFloat = 1

var jumpForce = -1200
var jumpPhysics = true
var movePhysics = true
var dir = 0
var gravity = 2000

func _physics_process(delta):
	
	#Gravidade
	if not is_on_floor():
		velocity.y += gravity * delta
	
	dir = Input.get_axis("ui_left", "ui_right")
	
	#Movimentação
	if dir != 0 and movePhysics:
		velocity.x = move_toward(velocity.x, maxSpeed * maxSpeedFloat * dir, accel * accelFloat * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, decel * decelFloat * delta)
	
	if is_on_floor() and jumpPhysics and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jumpForce
	
	
	move_and_slide()
