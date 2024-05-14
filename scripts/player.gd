extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sound = $JumpSound
@onready var game_manager = %GameManager
@export var Dagger : PackedScene
@onready var marker: Marker2D = $Marker2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
		

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()
		
	if Input.is_action_just_pressed("attack"): shoot()
		
	
	# Gets movement input: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip sprite based on movement input
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false
		
	# Play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
	
	# Applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func shoot():
	var dagger: Dagger = Dagger.instantiate()
	owner.add_child(dagger)
	dagger.transform = get_node("Marker2D").global_transform
	#game_manager.remove_dagger()
