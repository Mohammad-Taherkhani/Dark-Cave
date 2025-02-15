extends State

class_name AirState

@export var landing_state : State
@export var D_JUMP_VELOCITY : float = -300
@export var double_jump_animation : String = "jump_double"
@export var landing_animation : String = "jump_end"
@export var idle_animation : String = "idle"
@export var air_attack_state : State
@export var special_attack_state : State

var did_2jumped = false
var did_air_attack = false

func state_process(delta):
	if (character.is_on_floor()):
		next_state = landing_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump") && not did_2jumped):
		double_jump()
	if(event.is_action_pressed("specialattack")):
		airial_attack()
	elif(event.is_action_pressed("airattack")):
		air_attack()

func on_exit():
	if (next_state == landing_state ):
		playback.travel(landing_animation)
		did_2jumped = false

func double_jump():
	character.velocity.y = D_JUMP_VELOCITY
	playback.travel(double_jump_animation)
	did_2jumped = true
	MusicController.play_jump()

func air_attack():
	character.velocity.y -= D_JUMP_VELOCITY
	MusicController.play_air_attack()
	playback.travel("attack_air")
	next_state = air_attack_state
	did_2jumped = false
	
func airial_attack():
	MusicController.play_attack3()
	playback.travel("attack_special_air")
	next_state = special_attack_state
	did_2jumped = false
