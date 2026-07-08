extends CharacterBody2D 

const SPEED = 150.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 1

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var enemy_var__1_: AnimatedSprite2D = $AnimatedSprite2D 

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta
	

	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
		

	velocity.x = direction * SPEED


	move_and_slide()


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("playerAttack"):
		queue_free()
	if area.is_in_group("playerHitBox"):
		if not grafitis.invencible:
			if grafitis.grafitis > 0:
				grafitis.grafitis = 0
				grafitis.invencible = true
			else:
				get_tree().reload_current_scene()
