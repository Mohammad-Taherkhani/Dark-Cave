extends State

class_name attack_enemy

@export var walk : State
@export var attack : State

func state_process(delta : float):
	playback.travel("attack")

func _on_detector_body_exited(body: Node2D) -> void:
	playback.travel("walk")
	next_state = walk
	
