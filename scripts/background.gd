extends Node2D

@onready var baseRight: Sprite2D = $Base/Right
@onready var baseLeft: Sprite2D = $Base/Left
@onready var texture: Texture2D = baseRight.texture
@onready var texture_width = texture.get_size().x
@onready var viewport_width = get_viewport_rect().size.x

const SCROLL_SPEED = 100

func _process(delta):
	baseRight.position.x -= SCROLL_SPEED * delta
	baseLeft.position.x -= SCROLL_SPEED * delta
	if baseRight.position.x <= -texture_width / 2:
		baseRight.position.x = viewport_width + texture_width / 2
	if baseLeft.position.x <= -texture_width / 2:
		baseLeft.position.x = viewport_width + texture_width / 2
