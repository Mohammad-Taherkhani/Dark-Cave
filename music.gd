extends Node

var main_music = load("res://Music & sfx/Echoes-of-Time-v2(chosic.com).mp3")

func _ready() -> void:
	pass

func play_music():
	$music.stream = main_music
	$music.play()

func play_jump():
	$Jump.play()
	
func play_run():
	$run.play()
	
func play_heal():
	$heal.play()
	
func play_attack():
	$attack.play()
	
func play_attack2():
	$attack2.play()

func play_attack3():
	$attack3.play()

func play_air_attack():
	$air_attack.play()
	
func play_landing():
	$landing.play()

func play_waterdrops():
	$waterDrops.play()

func play_fire():
	$Fire.play()

func play_bones():
	$bones.play()
