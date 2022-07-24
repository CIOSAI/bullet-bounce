extends KinematicBody2D
class_name Entity

export var max_hp:float = 4.0
var hp:float = max_hp

func _ready():
	hp = max_hp

func death():
	print("death() not implemented")

func hurt(dmg:float):
	
	if dmg!=0:
		hp-=dmg
		if dmg>0:
			pass
#			Global.camera.screen_shake(dmg)
		else:
			hp = min(max_hp, hp)
	
#	print(name + " has been hit, hp at " + str(hp) )
	
	if hp<=0:
		death()
