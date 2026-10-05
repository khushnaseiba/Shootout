extends CharacterBody2D


var speed := 300.0
var direction_x : float
var jump := 200
var gravity := 1000
signal shoot(pos:Vector2,dir:Vector2)


func get_input():
	direction_x = Input.get_axis("left","right")
	if Input.is_action_just_pressed("jump"):
		velocity.y += -jump
		
	if Input.is_action_just_pressed("shoot") and $ShootTimer.time_left == 0:
		print("yo")
		shoot.emit(position,get_local_mouse_position())
		$ShootTimer.start()
func apply_gravity(delta):
	velocity.y += gravity * delta

func _physics_process(delta: float) -> void:
	get_input()
	velocity.x = direction_x * speed
	apply_gravity(delta)
	move_and_slide()
