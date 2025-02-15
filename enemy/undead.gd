extends CharacterBody2D

class_name Undead

@export var moving : Vector2 = Vector2.LEFT
@export var movment_speed : float = 20.0
@export var hit_state : State
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var character_state: Character_state = $Character_state
@onready var attack_player: Area2D = $Attack
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready():
	animation_tree.active = true

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction : Vector2 = moving
	if direction && character_state.check_if_can_move():
		velocity.x = direction.x * movment_speed 
	elif character_state.current_state != hit_state:
		velocity.x = move_toward(velocity.x, 0, movment_speed)


	move_and_slide()
