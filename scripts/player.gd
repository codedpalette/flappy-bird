extends CharacterBody2D

const GRAVITY = 400

# TODO: Rotate sprite
# TODO: Correct values for forces

func _physics_process(delta):
    velocity.y += GRAVITY * delta
    if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
        velocity.y -= GRAVITY * 2 * delta
    move_and_slide()