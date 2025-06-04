extends Node2D

@onready var sprite: Sprite2D = $PipeTop/Sprite2D
@onready var texture_width = sprite.texture.get_size().x
@onready var viewport_width = get_viewport_rect().size.x

@export_range(10.0, 100.0, 1.0) var gap = 50.0:
	get:
		return gap
	set(value):
		if is_node_ready():
			var old_gap = gap
			$PipeTop.position.y += (old_gap - value) / 2
			$PipeBottom.position.y -= (old_gap - value) / 2
		gap = value
		
var speed: float = 100

func _ready():
	$PipeTop.position.y -= gap / 2
	$PipeBottom.position.y += gap / 2

func _process(delta):
	position.x -= speed * delta
	# FIXME: Jittery movement
	#position = position.snapped(Vector2.ONE)
	if position.x < -texture_width:
		position.x = viewport_width
