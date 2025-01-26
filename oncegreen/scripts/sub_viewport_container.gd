extends SubViewportContainer

@onready var _timer_game = $"../SubViewportContainer2/SubViewport/HUD/LabelTimer/GameTimer"
@onready var _player = $"SubViewport/Player"
@onready var _camera = $"SubViewport/Player/Head/Camera3D"
@onready var _glitch_shader = $"../SubViewportContainer4"
@onready var _hud_shader = $"../SubViewportContainer2"

var _contrast = 1
var _fov_bonus = 0

#bob variables
const BOB_FREQ = 2.0
const BOB_AMP = 0.08
var t_bob = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	
	t_bob += delta
	
	
	if(_timer_game.time_left < 15):
		material.set_shader_parameter("u_contrast", _contrast)
		_glitch_shader.material.set_shader_parameter("shake_rate", 1)
		if(_contrast > 0): _contrast -= 0.002
		if(!_player.fov_lock): _player.fov_lock = true
		_camera.fov += 0.03
	if(_timer_game.time_left < 15):
		_hud_shader.material.set_shader_parameter("u_color_tex", preload("res://shader/assets/palette_mono.png"))
		#material.set_shader_parameter("u_dither_size", 1)
	#if(_timer_game.time_left < 10):
		#material.set_shader_parameter("u_dither_size", 8)
	#if(_timer_game.time_left < 5):
		#material.set_shader_parameter("u_dither_size", 16)
	#if(_timer_game.time_left < 4):
		#material.set_shader_parameter("u_dither_size", 32)
	#if(_timer_game.time_left < 3):
		#material.set_shader_parameter("u_dither_size", 64)
	#if(_timer_game.time_left < 2):
		#material.set_shader_parameter("u_dither_size", 128)
	#if(_timer_game.time_left < 1):
		#material.set_shader_parameter("u_dither_size", 256)
	if(_timer_game.time_left <= 0):
		get_tree().quit()


func _on_glitch_color_rate_timer_timeout() -> void:
	var rate = clamp(sin((t_bob * 1) * 1), 0.001, 0.1)
	_glitch_shader.material.set_shader_parameter("shake_color_rate", rate)
