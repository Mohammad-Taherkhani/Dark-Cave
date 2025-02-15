extends State

class_name can_damage_necromancer

signal on_hit(node : Node, damage_taken : int)

@export var health : float = 5 :
	get:
		return health
	set(value):
		Signalbus.emit_signal("on_health_changed", get_parent(), value - health )
		health=value

func hit(damage : int):
	health -= damage
	emit_signal("on_hit", get_parent(), damage)
