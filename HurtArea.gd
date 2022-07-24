extends Area2D
class_name HurtArea

var dmg:float = 0

func _on_HurtArea_body_entered(body):
	if body is Entity:
		body.hurt(dmg)
