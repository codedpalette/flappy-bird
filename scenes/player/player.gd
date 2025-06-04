extends CharacterBody2D

@export_range(1.0, 300.0, 1.0) var jump_velocity: float = 160.0
@export_range(10.0, 1000.0, 1.0) var gravity: float = 500.0

func _physics_process(delta):    
    velocity.y += gravity * delta
    if Input.is_action_just_pressed("jump"):
        velocity.y = -jump_velocity
    move_and_slide()