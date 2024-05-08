extends CharacterBody2D

@export var speed: float = 100
@export var initial_velocity: Vector2 = Vector2(1, 1)

var direction: Vector2 = Vector2(1, 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	velocity = initial_velocity.normalized()
	print("velocity", velocity)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#print("velocity", velocity)
	#position += direction * speed * delta
	#var collision = move_and_collide


func _physics_process(delta: float) -> void:
	pass
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		var collider = collision.get_collider()
		#print("Collision!", collider, collider.get_groups())
		#print("  ", collision.get_normal())
		var collider_groups = collider.get_groups()
		if collider_groups.has("bounceable"):
			velocity = velocity.bounce(collision.get_normal())
		elif collider_groups.has("loss_zone"):
			print("You lose!")
			set_process(false)
			queue_free()
		if collider_groups.has("destroyable"):
			collider.hit()

#func _on_body_entered(body: Node2D) -> void:
	#print("Collision!", body)
