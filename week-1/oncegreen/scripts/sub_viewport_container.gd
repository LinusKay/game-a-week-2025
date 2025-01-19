extends SubViewportContainer

@onready var _timer_game = $"../SubViewportContainer2/SubViewport/HUD/LabelTimer/GameTimer"
@onready var _player = $"SubViewport/Player"
@onready var _camera = $"SubViewport/Player/Head/Camera3D"
@onready var _glitch_shader = $"../SubViewportContainer4"

var _contrast = 1
var _fov_bonus = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(_timer_game.time_left < 8):
		material.set_shader_parameter("u_contrast", _contrast)
		_glitch_shader.material.set_shader_parameter("shake_rate", 1)
		if(_contrast > 0): _contrast -= 0.002
		if(!_player.fov_lock): _player.fov_lock = true
		_camera.fov += 0.03
	if(_timer_game.time_left <= 0):
		get_tree().quit()
