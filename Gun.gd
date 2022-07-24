extends Weapon

export var bullet_scene:PackedScene

func bullet_setup(b:HurtArea)->HurtArea:
	print(name + "bullet_setup not implemented")
	return b

func shoot():
	var b:HurtArea = bullet_scene.instance()
	bullet_setup(b)
	b.dmg = get_dmg()
	b.set_as_toplevel(true)
	add_child(b)
