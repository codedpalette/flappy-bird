extends Node2D

@onready var parallax: Parallax2D = $FloorParallax
@onready var sprite: Sprite2D = $FloorParallax/Sprite
@onready var collider: Area2D = $FloorCollider
const SCROLL_SPEED = 100

func _ready():
	parallax.repeat_size.x = sprite.texture.get_size().x
	collider.body_entered.connect(_on_body_entered)

func _process(delta):
	parallax.scroll_offset.x -= SCROLL_SPEED * delta

func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		Events.died.emit()
