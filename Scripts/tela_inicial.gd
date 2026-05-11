extends Control


@onready var play_button: Button = $VBoxContainer/playButton
@onready var credits_button: Button = $VBoxContainer/creditsButton
@onready var leave_button: Button = $VBoxContainer/leaveButton



func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_zone.tscn")


func _on_leave_button_pressed() -> void:
	get_tree().quit()
