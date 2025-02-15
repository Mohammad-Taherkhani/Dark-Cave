extends State

class_name GroundState

@export var JUMP_VELOCITY : float = -300.0
@export var SLIDE_SPEED : float = 1600
@export var air_state : State
@export var jump_animation : String = "jump"
@export var attack_state : State
@export var heal_state : State
@export var special_attack_state : State 
@export var attack_animation : String = "attack1"
@onready var buffer: Timer = $Buffer

var jump_buffered = false

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if (event.is_action_pressed("attack")):
		attack()
	if (event.is_action_pressed("heal")):
		heal()
	if (event.is_action_pressed("specialattack")):
		special_attack()

func jump():
	character.velocity.y = JUMP_VELOCITY
	next_state = air_state
	playback.travel(jump_animation)
	MusicController.play_jump()

func state_process(delta):
	if (!character.is_on_floor()):
		next_state = air_state

func attack():
	next_state = attack_state
	MusicController.play_attack()
	playback.travel(attack_animation)

func heal():
	next_state = heal_state
	playback.travel("heal")
	MusicController.play_heal()
	
func special_attack():
	next_state = special_attack_state
	playback.travel("attack_special")
