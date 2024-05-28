extends StaticBody2D

@export var value: int = 1

@onready var sound_manager = get_tree().get_first_node_in_group("sound_manager")
@onready var scoreboard = get_tree().get_first_node_in_group("scoreboard")

func hit() -> void:
	print("Hit a brick!  ", value)
	sound_manager.break_brick()
	scoreboard.score_points(value)
	queue_free()
