extends CharacterBody2D

@export var speed: float = 10
@export var initial_velocity: Vector2 = Vector2(1, 1)

@onready var sound_manager = get_tree().get_first_node_in_group("sound_manager")

var direction: Vector2 = Vector2(1, 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = initial_velocity.normalized()
	print("initial velocity:", velocity)


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		var collider = collision.get_collider()
		var collider_groups = collider.get_groups()
		if collider_groups.has("loss_zone"):
			print("You lose!")
			set_process(false)
			queue_free()
		else:
			if collider_groups.has("static_bounceable"):
				velocity = velocity.bounce(collision.get_normal())
				sound_manager.bounce()
			elif collider_groups.has("dynamic_bounceable"):
				velocity = global_position - collider.global_position
				velocity = velocity.normalized()
				sound_manager.bounce()
			if collider_groups.has("destroyable"):
				collider.hit()
