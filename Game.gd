extends Node2D

const BRICK_HEIGHT = 24

@onready var brick_container: Node2D = $BrickContainer

@export var num_bricks: int = 12
@export var num_rows: int = 3
@export var brick_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_bricks()


func generate_bricks() -> void:
	var win = get_viewport().size
	var brick_width = win.x / num_bricks
	var horiz_offset = brick_width / 2
	var vert_offset = BRICK_HEIGHT / 2

	for col in range(num_bricks):
		for row in range(num_rows):
			var new_brick = brick_scene.instantiate()
			brick_container.add_child(new_brick)
			new_brick.global_position = Vector2(
				horiz_offset + col * brick_width,
				vert_offset + row * BRICK_HEIGHT
			)
			new_brick.value = num_rows - row
