extends CharacterBody2D

@export var speed: float = 100
@export var initial_velocity: Vector2 = Vector2(1, 1)

var direction: Vector2 = Vector2(1, 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = initial_velocity.normalized()


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		var collider = collision.get_collider()
		var collider_groups = collider.get_groups()
		if collider_groups.has("bounceable"):
			velocity = velocity.bounce(collision.get_normal())
		elif collider_groups.has("loss_zone"):
			print("You lose!")
			set_process(false)
			queue_free()
		if collider_groups.has("destroyable"):
			collider.hit()
