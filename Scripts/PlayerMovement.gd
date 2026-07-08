extends CharacterBody2D

@onready var ponto_attack: Area2D = $pontoAttack
@onready var ponto_attack_2: CollisionShape2D = $pontoAttack/pontoAttack2
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player_hit_box_2: CollisionShape2D = $playerHitBox/playerHitBox2
@onready var player_hit_box: Area2D = $playerHitBox
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var ssj_attack: Area2D = $ssj_attack
@onready var ssj_attack_2: CollisionShape2D = $ssj_attack/ssj_attack2
@onready var ssj_timer: Timer = $ssj_timer

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

var canMove = true

var ssj_active = false

func _physics_process(delta):
	
	#Gravidade
	if not is_on_floor():
		velocity.y += gravity * delta
	
	dir = Input.get_axis("ui_left", "ui_right")
	
	#Movimentação
	if dir != 0 and movePhysics and canMove == true:
		velocity.x = move_toward(velocity.x, maxSpeed * maxSpeedFloat * dir, accel * accelFloat * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, decel * decelFloat * delta)
	
	if is_on_floor() and jumpPhysics and Input.is_action_just_pressed("ui_accept") and canMove == true:
		velocity.y = jumpForce
	
	
	move_and_slide()

func _ready() -> void:
	ponto_attack_2.disabled = true
	ssj_attack_2.disabled = true
	sprite_2d.play("Idle")
	game_manager.ssj = false


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down") && ssj_active == false:
		canMove = false
		ponto_attack_2.disabled = false
		sprite_2d.play("ponto_attack")
		await (get_tree().create_timer(3).timeout)
		canMove = true
		ponto_attack_2.disabled = true
		sprite_2d.play("Idle")
	
	
	if grafitis.invencible == true:
		set_collision_mask_value(2, false)
		await (get_tree().create_timer(2).timeout)
		set_collision_mask_value(2, true)
		grafitis.invencible = false

	if game_manager.SB >= 5:
		game_manager.ssj = true

	if grafitis.grafitis >= 10 && game_manager.ssj == true:
		ssj_active = true
		ssj_attack_2.disabled = false
		sprite_2d.play("ponto_ssj")


	if grafitis.grafitis == 0 && ssj_active == true:
		sprite_2d.play("Idle")
		ssj_attack_2.disabled = true
		ssj_active = false


func _on_ssj_timer_timeout() -> void:
	if ssj_active == true:
		grafitis.grafitis -= 1
