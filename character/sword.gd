extends Area2D

@export var damage : int = 2
@export var player : Player
@export var facing_collision : FacingCollisionShape

func _ready():
	monitoring = false
	player.connect("facing_changed", _on_player_facing_direction)

func _on_body_entered(body):
	for child in body.get_children():
		if child is can_damage:
			var direction_to_hit = (body.global_position - get_parent().global_position)
			var direction_sign = sign(direction_to_hit.x)
			child.hit(damage)


func _on_player_facing_direction(facing_right : bool):
	if(facing_right):
		facing_collision.position = facing_collision.facing_right
	else:
		facing_collision.position = facing_collision.facing_left
	
	
