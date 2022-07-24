extends Entity

const MAX_SPEED = 40
const SPRINT_SPEED = 160
const ACCELERATION = 4
const SPRINTING = 8
const FRICTION = 10
const MAX_STAMINA = 2

var velocity = Vector2.ZERO
var stamina = MAX_STAMINA
var time = 0

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	input_vector.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	input_vector = input_vector.normalized()
#	print(stamina, " : ", time)
	if not Input.is_action_pressed("Sprint") and stamina < MAX_STAMINA:
			stamina += delta * 0.4
			time += delta
	
	if input_vector != Vector2.ZERO:
		if Input.is_action_pressed("Sprint") and stamina > 0:
			velocity = velocity.move_toward(input_vector * SPRINT_SPEED, SPRINTING)
			stamina -= delta
		else:
			velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	move_and_slide(velocity)
	look_at(get_global_mouse_position())
