extends CharacterBody2D

@export_range(1.0, 300.0, 1.0) var jump_velocity: float = 160.0
@export_range(10.0, 1000.0, 1.0) var gravity: float = 500.0

func _physics_process(delta):
    velocity.y += gravity * delta
    # TODO: Variable jump height
    if Input.is_action_just_pressed("jump"):
        velocity.y = - jump_velocity
    var collisions := move_and_collide(velocity * delta)
    if collisions:
        print("Collided with ", collisions.get_collider().name)