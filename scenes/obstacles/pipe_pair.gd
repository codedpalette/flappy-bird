extends Node2D

class_name PipePair

const SPEED = 100
@onready var visible_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var pipe_top: StaticBody2D = $PipeTop
@onready var pipe_bottom: StaticBody2D = $PipeBottom

var gap = 50.0:
	set(value):
		gap = value
		update_gap()
var _exited: bool = false

func update_gap():
	pipe_top.position.y = - gap / 2
	pipe_bottom.position.y = gap / 2

func _ready():
	visible_notifier.connect("screen_exited", func(): _exited = true)
	update_gap()

func _physics_process(delta):
	position.x -= SPEED * delta
	if _exited:
		position.x = 0
		_exited = false
