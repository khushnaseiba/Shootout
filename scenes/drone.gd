extends CharacterBody2D

var direction : Vector2
var speed := 50
var player : CharacterBody2D
var health := 3

func _on_area_2d_body_entered(body) -> void:
	if body.name == "player":
		player = body

func _physics_process(_delta: float) -> void:
	if player:
		var dir = (player.position - position).normalized()
		velocity = dir * speed
		move_and_slide()

func _on_area_2d_body_exited(_body:Node2D):
	player = null



func _on_area_2d_2_body_entered(_body: Node2D) -> void:
	explode()

func hit():
	health -=1
	if health <= 0 :
		explode()
		
	var tween = create_tween()
	tween.tween_property($AnimatedSprite2D.material,'shader_parameter/progress',0.0,0.2)
	tween.tween_property($AnimatedSprite2D.material,'shader_parameter/progress',1.0,0.5)
	tween.tween_property($AnimatedSprite2D.material,'shader_parameter/progress',0.0,0.2)
	
func explode():
	$AudioStreamPlayer2D.play()
	speed = 0
	$AnimatedSprite2D.hide()
	$Sprite2D.show()
	$AnimationPlayer.play("explode")
	await  $AnimationPlayer.animation_finished
	for drone in get_tree().get_nodes_in_group("Drones"):
		if position.distance_to(drone.position) < 10 :
			drone.explode()
	queue_free()
