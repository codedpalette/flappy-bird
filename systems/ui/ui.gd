extends CanvasLayer
class_name UI

@onready var game_over_panel: Control = $GameOver
@onready var restart_button: Button = $GameOver/RestartButton
@onready var score_label: Label = $Score
signal restart_game

func _ready():
    game_over_panel.hide()
    restart_button.connect("pressed", func(): restart_game.emit())

func show_game_over():
    game_over_panel.show()

func update_score(score: int):
    score_label.text = str(score)