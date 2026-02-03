extends CharacterBody2D
class_name Player
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound

const SPEED = 130.0
const JUMP_VELOCITY = -350.0
var direction = 0

func _input(event):
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if event.is_action_pressed("move_down"):
		set_collision_mask_value(10, false)
	else:
		set_collision_mask_value(10, true)
func _physics_process(delta):
	
	if velocity.x > 1 or velocity.x < -1:
		animated_sprite_2d.animation = "walk"
	else:
		animated_sprite_2d.animation = "idle"
		
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	elif velocity.y > 0.0:
		animated_sprite_2d.play("fall")
	
	

	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:           
		velocity.x = move_toward(velocity.x, 0, SPEED )

	move_and_slide()
	
	if direction == 1.0:
		animated_sprite_2d.flip_h = false
	elif direction == -1.0:
		animated_sprite_2d.flip_h = true
	
func die():
	print("Player is dying...")
		
	set_physics_process(false)
	animated_sprite_2d.play("die")
	
	await get_tree().create_timer(0.6).timeout 
	
	get_tree().reload_current_scene()
