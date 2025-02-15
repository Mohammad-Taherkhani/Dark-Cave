extends Area2D

@export var target_scene =  PackedScene 

func _ready( ):
	pass

func _input(event):
	if event.is_action_pressed("interact"):
		if !target_scene: 
			print("no scene in this door")
			return
		if get_overlapping_bodies().size() > 0:
			next_level( )

func next_level():
	var ERR = get_tree().change_scene_to_file("res://scene/level_final.tscn")

	if ERR != OK:
		print("something failed in the door scene")
