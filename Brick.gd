extends StaticBody2D


func hit() -> void:
	print("Hit a brick!")
	queue_free()
