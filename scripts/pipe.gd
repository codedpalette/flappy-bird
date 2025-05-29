extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var texture_width = sprite.texture.get_size().x
@onready var viewport_width = get_viewport_rect().size.x

var speed: float = 100

func _physics_process(delta):
    position.x -= speed * delta
    position = position.snapped(Vector2.ONE)
    if position.x < -texture_width:
        position.x = viewport_width
