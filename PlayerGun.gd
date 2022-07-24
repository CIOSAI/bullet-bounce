extends "res://Gun.gd"

func bullet_setup(b:HurtArea):
	b.global_position = global_position
	b.dir = Vector2.RIGHT.rotated(global_rotation)
	return b

func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("Attack"):
		shoot()
