extends State

class_name walk_necro

@export var attack_state : State
@export var attack_animation : String = "summon"
@onready var fire: AnimatedSprite2D = $"../../fire"
@onready var fire_2: AnimatedSprite2D = $"../../fire2"
@onready var fire_3: AnimatedSprite2D = $"../../fire3"
@onready var fire_4: AnimatedSprite2D = $"../../fire4"
@onready var fire_5: AnimatedSprite2D = $"../../fire5"
@onready var fire_6: AnimatedSprite2D = $"../../fire6"
@onready var fire_7: AnimatedSprite2D = $"../../fire7"
@onready var fire_8: AnimatedSprite2D = $"../../fire8"



func _on_detector_body_entered(body: Node2D):
	playback.travel(attack_animation)
	next_state = attack_state
	fire.play("default")
	fire_2.play("default")
	fire_3.play("default")
	fire_4.play("default")
	fire_5.play("default")
	fire_6.play("default")
	fire_7.play("default")
	fire_8.play("default")
	
