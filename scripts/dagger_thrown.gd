extends Area2D

var speed = 750

func _physics_process(delta):
	position = transform.x * speed * delta
	
func bullet_hit():
	print("Hit")
