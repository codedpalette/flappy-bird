extends Node2D

const SPEED = 100
@onready var visible_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var pipe_top: StaticBody2D = $PipeTop
@onready var pipe_bottom: StaticBody2D = $PipeBottom
@onready var starting_positions: Array[float] = [pipe_top.position.y, pipe_bottom.position.y]
@onready var viewport_width = get_viewport_rect().size.x
@export_range(0.0, 100.0, 1.0) var gap = 50.0:
	set(value):
		gap = value
		if is_node_ready(): update_gap()
var exited: bool = false

func update_gap():
	pipe_top.position.y = starting_positions[0] - gap / 2
	pipe_bottom.position.y = starting_positions[1] + gap / 2

func _ready():
	visible_notifier.connect("screen_exited", func(): exited = true)
	update_gap()


func _physics_process(delta):
	position.x -= SPEED * delta
	if exited:
		position.x = viewport_width
		exited = false
