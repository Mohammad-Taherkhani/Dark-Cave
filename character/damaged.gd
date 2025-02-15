extends State

class_name damaged

@export var damage : can_damage
@export var character_state : Character_state
@export var dead_state : State
@export var hit_animation : String = "hurt"
@export var dead_animation : String = "dead"
@export var return_state : State
@export var hurt_state : State

func _ready():
	damage.connect("on_hit", on_damage_hit)

func on_enter():	
	pass

func on_damage_hit(node: Node, damage_amount : int):
	if (damage.health > 0):
		emit_signal("interrupt_state", hurt_state)
		playback.travel(hit_animation)
	elif (damage.health == 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation)

func on_exit():
	character.velocity = Vector2.ZERO
