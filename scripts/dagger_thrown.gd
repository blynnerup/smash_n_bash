extends Area2D

class_name Dagger

var speed = 200

func _physics_process(delta):
	position += transform.x * speed * delta
	
func bullet_hit():
	print("Hit")

func _on_body_entered(body):
	print("Hit")
	body.queue_free()
