extends CharacterBody2D

@export var speed: int = 500
var can_shoot: bool = true

signal laser(pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	#shoot
	if Input.is_action_just_pressed("shoot") and can_shoot:
		$LaserSound.play()
		laser.emit($LaserStartPosition.global_position)
		can_shoot = false
		$LaserTimer.start()

func play_collision_sound():
	$DamageSound.play()
	
func _on_laser_timer_timeout() -> void:
	can_shoot = true
