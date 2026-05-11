extends Node2D

const SPEED = 150

var direction = 1

@onready var sprite_2d: Sprite2D = $"."
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight



func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
	position.x += direction * SPEED * delta
