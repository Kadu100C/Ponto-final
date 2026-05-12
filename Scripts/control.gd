extends Control

@onready var grafiti_counter: Label = $MarginContainer/HBoxContainer/grafitiCounter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grafiti_counter.text = "%02d" % grafitis.grafitis


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	grafiti_counter.text = "%02d" % grafitis.grafitis
