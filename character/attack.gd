extends State

@export var return_state : State
@export var still : String = "Move"
@export var strike1 : String = "attack1"
@export var strike2 : String = "attack2"
@export var strike3 : String = "attack3"
@export var strike4 : String = "attack4"
@onready var timer: Timer = $Timer

func state_input(event : InputEvent):
	if (event.is_action_pressed("attack")):
		timer.start()

func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == strike1):
		MusicController.play_attack2()
		if (timer.is_stopped()):
			next_state = return_state
			playback.travel(still)
		else:
			playback.travel(strike2)
	
	if (anim_name == strike2):
		MusicController.play_attack3()
		if (timer.is_stopped()):
			next_state = return_state
			playback.travel(still)
		else:
			playback.travel(strike3)
	
	if (anim_name == strike3):
		next_state = return_state
		playback.travel(still)
