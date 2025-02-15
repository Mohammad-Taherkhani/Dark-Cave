extends State

class_name Hit

@export var new_state : State

func state_input(event : InputEvent):
	pass

func state_process(delta):
	pass	
	
func on_enter():
	pass

func on_exit():
	next_state = new_state
