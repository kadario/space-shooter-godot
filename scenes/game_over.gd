extends Control

@export var level_scene: PackedScene

func _ready() -> void:
	$ColorRect/VBoxContainer/Label2.text = $ColorRect/VBoxContainer/Label2.text + str(Global.score)
	$OverSound.play()

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
