extends Label

@export var state_mechine : Character_state

func _ready():
	pass 


func _process(delta: float):
	text = state_mechine.current_state.name
