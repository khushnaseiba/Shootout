extends Node2D

var bullet_scene = preload("res://scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_shoot(pos: Vector2, dir: Vector2) -> void:
	var bullet = bullet_scene.instantiate() as Area2D
	$Bullets.add_child(bullet)
	var tween = get_tree().create_tween()
	tween.tween_property(bullet , "scale" , Vector2(0.0,0.0) , 0.2)
	tween.tween_property(bullet , "scale" , Vector2(1.5,1.5) , 0.4)
	bullet.setup(pos,dir)
