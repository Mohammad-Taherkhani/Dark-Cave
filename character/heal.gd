extends State

@export var return_state : State
@export var damage : can_damage

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if (anim_name == "heal"):
		damage.health = 4
		next_state = return_state
