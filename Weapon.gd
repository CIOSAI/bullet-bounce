extends Node2D
class_name Weapon

onready var anim = $"AnimationPlayer"
onready var rng = RandomNumberGenerator.new()

export (Resource) var attribute

func _ready():
	assert(attribute is WeaponAttribute, "attribute is not a WeaponAttribute")
	rng.randomize()

func attack():
	anim.play("base_attack")

func crit() -> bool:
	return rng.randf_range(0, 1)<attribute.crit_chance

func get_dmg() -> float:
	return (attribute.crit_scale if crit() else 1.0)*attribute.base_dmg
