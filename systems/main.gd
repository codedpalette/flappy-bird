extends Node2D

enum State {PLAYING, PAUSED, GAME_OVER}

@onready var ui: UI = $UI
var state: State = State.PLAYING
var score: int = 0

func _ready():
    Events.died.connect(_on_died)
    Events.scored.connect(_on_scored)
    ui.restart_game.connect(_on_restart_game)

func _on_died():
    state = State.GAME_OVER
    ui.show_game_over()

func _on_scored():
    score += 1
    print("score: ", score)

func _on_restart_game():
    get_tree().reload_current_scene()