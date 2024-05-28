extends StaticBody2D

@export var value: int = 1

@onready var scoreboard = get_tree().get_first_node_in_group("scoreboard")

func hit() -> void:
	print("Hit a brick!  ", value)
	scoreboard.score_points(value)
	queue_free()
