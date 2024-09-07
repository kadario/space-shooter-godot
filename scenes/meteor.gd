extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float
var can_collide := true

signal collision

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	
	#texture
	var path: String = "res://graphic/meteor_" + str(rng.randi_range(1, 2)) + ".png"

	$SprMeteorSmall.texture = load(path)
	
	# start position
	var width = get_viewport().get_visible_rect().size[0]
	#var height = get_viewport().get_visible_rect().size[1]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-100, -50)
	
	position = Vector2(random_x, random_y)
	
	speed = rng.randi_range(200, 500)
	direction_x = rng.randi_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)
	
	
func _process(delta: float) -> void:
	position += Vector2(0, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta
	

func _on_body_entered(_body: Node2D) -> void:
	if can_collide:
		collision.emit()

func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	$ExplosionSound.play()
	$SprMeteorSmall.hide()
	can_collide = false
	await get_tree().create_timer(1).timeout
	queue_free()
