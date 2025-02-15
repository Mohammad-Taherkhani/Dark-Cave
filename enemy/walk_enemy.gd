extends State

class_name walk_enemy

@export var attack_state : State
@export var attack_animation : String = "attack"


func _on_detector_body_entered(body: Node2D):
	MusicController.play_attack2()
	playback.travel(attack_animation)
	next_state = attack_state
	
