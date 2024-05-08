extends StaticBody2D

@export var tin: int = 10
@export var tout: int = 50

var thalf
var win
var shape
var shapeowner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win = get_viewport().size
	thalf = (tin + tout) / 2
	#for extpos in [
		#[Vector2(thalf, win.y / 2), Vector2(tin - thalf, win.y / 2)], # Left
		#[Vector2(thalf, win.y / 2), Vector2(win.x + thalf - tin, win.y / 2)], # Right
		#[Vector2(win.x / 2, thalf), Vector2(win.x / 2, tin - thalf)], # Top
		#[Vector2(win.x / 2, thalf), Vector2(win.x / 2, win.y + thalf - tin)], # Bottom
	#]:
		#shape = RectangleShape2D.new()
		#shape.extents = extpos[0]
		#shapeowner = create_shape_owner(self)
		#shape_owner_set_transform(shapeowner, Transform2D(0, extpos[1]))
		#shape_owner_add_shape(shapeowner, shape)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
