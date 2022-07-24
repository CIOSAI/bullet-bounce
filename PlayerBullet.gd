extends HurtArea

onready var rays = [$"BounceRay/Right", $"BounceRay/Down", $"BounceRay/Left", $"BounceRay/Up"]

var dir:Vector2 = Vector2.RIGHT
var speed:float = 300.0
var max_bounce:int = 3
var total_bounce:int = 0
var actual_dmg:float = 0

func _ready():
	actual_dmg = dmg
	dmg = 0
	
	var r:float = $"BounceArea/CollisionShape2D".shape.radius
	
	for i in rays:
		i.cast_to.x = r+10 #in case its right on the edge

func _physics_process(delta):
	global_position += dir*speed*delta

func ray_sort(a:RayCast2D, b:RayCast2D)->bool:
	return (
	a.get_collision_point().distance_squared_to(global_position)
	<
	b.get_collision_point().distance_squared_to(global_position)
	)

func get_normal(body)->Vector2:
	var collided_rays = []
	
	for i in rays:
		if i.is_colliding():
			if body == i.get_collider():
				collided_rays.append(i)
	
	collided_rays.sort_custom(self, "ray_sort")
	
	return collided_rays[0].get_collision_normal()

func _on_BounceArea_body_entered(body):
	total_bounce += 1
	if total_bounce==1:
		dmg = actual_dmg
	else:
		dmg = 0
	if total_bounce>max_bounce: queue_free()
	
	dir = dir.reflect(get_normal(body).rotated(TAU/4))
