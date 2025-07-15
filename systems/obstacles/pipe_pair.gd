extends Node2D
class_name PipePair

const SPEED = 100
@onready var visible_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var pipe_top: Area2D = $PipeTop
@onready var pipe_bottom: Area2D = $PipeBottom

var gap:
	set(value):
		gap = value
		_update_gap()

func _ready():
	Events.died.connect(set_physics_process.bind(false))

func _physics_process(delta):
	position.x -= SPEED * delta

func _update_gap():
	pipe_top.position.y = - gap / 2
	pipe_bottom.position.y = gap / 2
