extends State

@export var return_state : State

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if (anim_name == "attack_special" || anim_name == "attack_special_air" ):
		next_state = return_state
