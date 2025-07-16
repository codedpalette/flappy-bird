extends Node2D

enum State {PLAYING, PAUSED, GAME_OVER}

var state: State = State.PLAYING
var score: int = 0

func _ready():
    Events.died.connect(_on_died)
    Events.scored.connect(_on_scored)

func _input(event):
    if event.is_action_pressed("jump") and state == State.GAME_OVER:
        get_tree().reload_current_scene()

func _on_died():
    state = State.GAME_OVER

func _on_scored():
    score += 1
    print("score: ", score)