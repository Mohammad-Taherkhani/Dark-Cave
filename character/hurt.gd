extends State

class_name hurt

@export var hit_animation : String = "hurt"
@export var return_state : State

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if (anim_name == hit_animation):
		next_state = return_state

func on_enter():
	pass
