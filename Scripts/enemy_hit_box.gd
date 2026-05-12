extends Area2D

func _on_hit_box_area_shape_entered(area: Area2D) -> void:
	if area.is_in_group("playerHitBox"):
		grafitis.grafitis = 0
		grafitis.invencible = true
	if area.is_in_group("playerHitBox") and grafitis.grafitis == 0:
		get_tree().reload_current_scene()
