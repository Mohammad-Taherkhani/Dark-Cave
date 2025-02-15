extends State

class_name dead_enemy

@export var dead_animation : String = "dead"

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == dead_animation:
		get_tree().change_scene_to_file("res://scene/finish.tscn")
