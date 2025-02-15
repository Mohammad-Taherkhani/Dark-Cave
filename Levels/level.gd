extends Node2D

@onready var camera_2d: Camera2D = $Camera2D
@onready var ralf: Player = $Kaldor
@onready var hearts_Container = $CanvasLayer/hearts
@onready var character = $Kaldor
@onready var health_bar: ProgressBar = $CanvasLayer/Health_Bar

func _ready():
	camera_2d.position.x = ralf.position.x
	MusicController.play_music()

func _process(delta: float) -> void:
	health_bar.value = character.get_node("Can_damage").health

func _on_spike_body_entered(body: CharacterBody2D):
	if body == ralf:
		get_tree().reload_current_scene()
