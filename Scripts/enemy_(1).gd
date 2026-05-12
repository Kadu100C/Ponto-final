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


func _on_hit_box_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("playerAttack"):
		queue_free()


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
