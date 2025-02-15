extends State_Enemy

@onready var collision: CollisionShape2D = %CollisionNecro
@onready var progress_bar: ProgressBar = $"../../UI/ProgressBar"

 
var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)
		progress_bar.set_deferred("visible",value)
 
 
func transition():
	if player_entered:
		get_parent().change_state("Summon")




func _on_player_entered(_body):
	player_entered = true
