extends Parallax2D

@onready var sprite: Sprite2D = $Sprite
const SCROLL_SPEED = 100

func _ready():
	repeat_size.x = sprite.texture.get_size().x

func _process(delta):
	scroll_offset.x -= SCROLL_SPEED * delta
