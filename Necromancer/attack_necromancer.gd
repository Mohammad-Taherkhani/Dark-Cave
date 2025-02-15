extends State

class_name attack_necromancer

@export var walk : State
@export var attack : State

func _on_detector_body_exited(body: Node2D) -> void:
	MusicController.play_fire()
	playback.travel("idle")
	next_state = walk
