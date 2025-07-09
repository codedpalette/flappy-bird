extends Node2D

class_name PipePair

const SPEED = 100
@onready var visible_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var pipe_top: Area2D = $PipeTop
@onready var pipe_bottom: Area2D = $PipeBottom

var gap = 50.0:
	set(value):
		gap = value
		if is_node_ready(): _update_gap()


func _ready():
	_update_gap()
	pipe_top.body_entered.connect(_on_body_entered)
	pipe_bottom.body_entered.connect(_on_body_entered)
	Events.died.connect(set_physics_process.bind(false))

func _physics_process(delta):
	position.x -= SPEED * delta

func _update_gap():
	pipe_top.position.y = - gap / 2
	pipe_bottom.position.y = gap / 2

func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		Events.died.emit()
