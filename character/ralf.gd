extends CharacterBody2D

class_name Player

@export var SPEED : float = 200.0
@onready var knight : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_mechine : Character_state = $Character_State

var direction : Vector2 = Vector2.ZERO
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal facing_changed(facing_right : bool)

func _ready():
	animation_tree.active = true

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	direction = Input.get_vector("left", "right","up","down")
	
	if direction.x !=0 && state_mechine.check_if_can_move():
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		MusicController.play_run()

	move_and_slide()
	update_animation()
	update_face_direction()
	
func update_animation():
	animation_tree.set("parameters/Move/blend_position", direction.x)

func update_face_direction():
	if direction.x > 0:
		knight.flip_h = false

	elif direction.x < 0:
		knight.flip_h = true	

	emit_signal("facing_changed", !knight.flip_h)

func change_scene():
	get_tree().change_scene_to_file("res://scene/level.tscn")
	
