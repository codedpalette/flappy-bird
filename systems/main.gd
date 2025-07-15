extends Node2D

enum State {PLAYING, PAUSED, GAME_OVER}

var state: State = State.PLAYING

func _ready():
    Events.died.connect(_on_died)

func _input(event):
    if event.is_action_pressed("jump") and state == State.GAME_OVER:
        get_tree().reload_current_scene()

func _on_died():
    state = State.GAME_OVER