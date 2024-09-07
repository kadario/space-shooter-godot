extends Area2D

@export var speed: int = 500

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($Sprite2D, 'scale', Vector2(0.25, 0.25), 0.2).from(Vector2(0,0))

func _process(delta: float) -> void:
	position.y -=  speed * delta
 
