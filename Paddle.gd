extends Node2D

@export var speed: float = 600
@export var width: int = 100

var half_width
var win

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win = get_viewport().size
	#print($PaddleBox.get_aabb())
	#print($PaddleBox.mesh.get_aabb())
	half_width = width / 2
	#$PaddleBox.size.x = width


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		position.x += -speed * delta
	elif Input.is_action_pressed("move_right"):
		position.x += speed * delta
	position.x = clamp(position.x, half_width, win.x - half_width)
