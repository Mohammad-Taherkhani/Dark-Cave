extends Node

var current_state: State_Enemy
var previous_state: State_Enemy
 
func _ready():
	current_state = get_child(0) as State_Enemy
	previous_state = current_state
	current_state.enter()
 
func change_state(state):
	if state == previous_state.name:
		return
 
	current_state = find_child(state) as State_Enemy
	current_state.enter()
 
 
	previous_state.exit()
	previous_state = current_state
 
