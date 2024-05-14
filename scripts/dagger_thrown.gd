extends Area2D

class_name Dagger
@onready var sprite = $Sprite2D

var speed = 200
var direction: int

func _physics_process(delta):
	print(direction)
	position += (transform.x * direction) * speed * delta
	
	
func bullet_hit():
	print("Hit")

func _on_body_entered(body):
	print("Hit")
	body.queue_free()
	queue_free()
