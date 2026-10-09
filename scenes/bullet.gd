extends Area2D

var direction : Vector2
var speed := 100

func _ready() -> void:
	$AudioStreamPlayer2D.play()

func setup(pos:Vector2,dir:Vector2):
	position = pos + dir * 10
	direction = dir 


func _physics_process(delta: float) -> void:
	position += direction * speed * delta



func _on_body_entered(body) -> void:
	if "hit" in body:
		body.hit.call_deferred()
	queue_free()
