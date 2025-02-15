extends Node2D

@onready var camera_2d: Camera2D = $Camera2D
@onready var ralf: Player = $Kaldor
@onready var hearts_Container = $CanvasLayer/hearts
@onready var character = $Kaldor
@onready var health_bar: ProgressBar = $CanvasLayer/Health_Bar
@onready var health_bar_necro: ProgressBar = $CanvasLayer/Health_Bar_necro
@onready var necromancer = $Necromancer

func _ready():
	camera_2d.position.x = ralf.position.x
	MusicController.play_music()

func _process(delta: float) -> void:
	health_bar.value = character.get_node("Can_damage").health
	health_bar_necro.value = necromancer.get_node("Can_Damage").health

func _on_spike_body_entered(body: CharacterBody2D):
	if body == ralf:
		get_tree().reload_current_scene()
