extends Area2D

@export_range(1.0, 300.0, 1.0) var jump_velocity: float = 160.0
@export_range(10.0, 1000.0, 1.0) var gravity_force: float = 500.0

var _velocity: Vector2 = Vector2.ZERO

func _ready():
    area_entered.connect(_on_area_entered)
    Events.died.connect(set_physics_process.bind(false))

func _physics_process(delta):
    _velocity.y += gravity_force * delta
    if Input.is_action_just_pressed("jump"):
        _velocity.y = - jump_velocity
    position += _velocity * delta

func _on_area_entered(area: Area2D):
    if area.is_in_group("obstacles"):
        Events.died.emit()
    elif area.is_in_group("score"):
        Events.scored.emit()