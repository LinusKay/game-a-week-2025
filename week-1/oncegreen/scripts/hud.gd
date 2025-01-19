extends CanvasLayer

@onready var _heart_sprite = $HUDHeart
@onready var _polyfox_sprite = $HUDPolyfox
@onready var _planet_sprite = $HUDPlanet
@onready var _eyes_sprite = $HUDEyes
@onready var _xray_sprite = $HUDXray
@onready var _planets_sprite = $HUDPlanets
@onready var _cross_sprite = $HUDCross

@onready var _player = $"../../../SubViewportContainer/SubViewport/Player"
@onready var _sfx_dying_radio = $"../../../AudioBackgroundMusic/SFXAlienRadio"
@onready var _sfx_dying_talkingchoppy = $"../../../AudioBackgroundMusic/SFXTalkingChoppy"
@onready var _sfx_dying_talkingchoppy2 = $"../../../AudioBackgroundMusic/SFXTalkingChoppy2"

var _logs = [
	["\nPlanet: Nahboris", 5],
	["\nRShock: 0138", 1],
	["\nMemnis: a47843", 2],
	["\nCorrectionV: d093j9", 2],
	["\na_1: 32", .1],
	["\na_2: 34", .1],
	["\nFluids: Minimal", 3],
	["\ntemp: 58c", 1],
	["\nHealth:", 2],
	["Catastrophic", 4],
	["\nImplant_stat:", 2],
	["\n- a98a7f9: poor", 2],
	["\n- 3802jd9: offline", 3],
	["\n- d094hf8: offline", 3],
	["\n- 8b98wd4: damaged", 2],
	["\nnetwork:", 2],
	[" .", 1],
	[" .", 1],
	[" .", 1],
	["offline", 5],
	["\ncerebral-spike: 15%", 1],
	["\ncoolant: 08%", 2],
	["\n[124]32904", .1],
	["\n[642]90234", .5],
	["\n[960]-29353", 1],
	["\n[009]69843", .3],
	["\nvindmar: operational", 1],
	["\nelixon: 03254", 2],
	["\nm_map_pre: &1 kra 4132", 1],
	["\ntotality: x", 3],
	["\ngm34e_stat: ", 1],
	["!error", 2],
	["\n!error", .1],
	["\ndying", 1],
	["\n!error", .1],
	["\n!error", .1],
	["\nyou are dying", .1],
	["\n!error", .1],
	["\n!error", .1],
	["\n!error", .1],
	["\n!error", .1],
	["\n!error", .1],
	["\n!error", .1],
	["\n!error", .1],
	["\nyou are dying", 1],
	["\n!error", .1],
	["\n!error", .1],
]
var _log_index = 0

var _messages = [
	#["Connection lost.", 1],
	#["Connection lost. .", 1],
	#["Connection lost. . .", 1],
	#["!Temperature overload", 1],
	["This place was green once", 5],
	["Primaris, Tolaris, Orus orbit a dead planet.", 5],
	["", 5],
	["When man fell to rust and chemical", 5],
	["all they left was red.", 5],
	["", 5],
	["Yet from the grave, the collosi howls...", 5],
	["Red Nahboris' winds long for contact.", 5],
	["", 5],
	["The groans of an earthen behemoth.", 5],
	["The very dust begs to be ingested.", 5],
	["To crawl into every orifice", 5],
	["To pool in every pit", 5],
	["", 5],
	["None shall again grace Nahboris' mantle", 5],
	["That which spits fire and hellish plumes.", 5],
	["which screams with banshee wind.", 5],
	["whose miles-deep flesh covets a cosmic heart.", 5],
	#["", 2],
	#["Trees", 1],
	#["Leaves", 1],
	#["Life", 1],
	#["Nobody to tell of these things.", 5],
	#["!Temperature overload", 1],
	#["", 2],
	#["High impact displays ", 1],
	#["Implants beyond the Altun limit turned flesh to waste.", 1],
	#["Trafficked psycho-severants leave the mental in bits.", 1],
	#["Nobody to tell of these things.", 5],
	#["A mother kisses her child, as they leave for school.", 3],
	#["Fires burn in a capital.", 3],
	#["", 2],
	#["This place was green once.", 5],
	#["!Temperature overload", 1],
	#["This", .1],
	#["place", .1],
	#["was", .1],
	#["green", .1],
	#["once", .1],
	#["This", .1],
	#["place", .1],
	#["was", .1],
	#["green", .1],
	#["once", .1],
	#["goodbye", .5],
	#["This", .1],
	#["place", .1],
	#["was", .1],
	#["green", .1],
	#["once", .1],
	#["let your HUD lull you asleep", .5],
	#["This", .1],
	#["place", .1],
	#["was", .1],
	#["green", .1],
	#["once", .1],
	
]
var _message_index = -1

@onready var _videos = [
	$VideoStreamPlayer,
	$VideoStreamPlayer2,
	$VideoStreamPlayer3,
	$VideoStreamPlayer4,
	$VideoStreamPlayer5,
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_heart_sprite.play("default")
	_polyfox_sprite.play("default")
	_planet_sprite.play("default")
	_eyes_sprite.play("default")
	_xray_sprite.play("default")
	_planets_sprite.play("default")
	_cross_sprite.play("default")
	
	$LabelVelocity.text = "velocity:" + str(_player.velocity)
	$LabelCoordsX.text = "x:" + str(_player.position.x)
	$LabelCoordsY.text = "y:" + str(_player.position.y)
	$LabelCoordsZ.text = "z:" + str(_player.position.z)

	$LabelMessage.text = _messages[_message_index][0]
	
	$LabelImplantError.text = "Visual Implant: Fatal Error: " + str(round($LabelTimer/GameTimer.time_left))
	
	if($LabelTimer/GameTimer.time_left < 280):
		$HUDXray.show()	
	if($LabelTimer/GameTimer.time_left < 255):
		$LabelImplantError.show()
	var _video_popup = 200
	if($LabelTimer/GameTimer.time_left < _video_popup):
		$VideoStreamPlayer.show()		
	if($LabelTimer/GameTimer.time_left < _video_popup - 1):
		$VideoStreamPlayer2.show()
	if($LabelTimer/GameTimer.time_left < _video_popup - 2):
		$VideoStreamPlayer3.show()
	if($LabelTimer/GameTimer.time_left < _video_popup - 3):
		$VideoStreamPlayer4.show()
	if($LabelTimer/GameTimer.time_left < _video_popup - 4):
		$VideoStreamPlayer5.show()	
	if($LabelTimer/GameTimer.time_left < 120):
		$VideoStreamPlayerFocus.show()
	if($LabelTimer/GameTimer.time_left < 60):
		$HUDPlanets.speed_scale = 1.5
		if(!_sfx_dying_talkingchoppy.playing):
			_sfx_dying_talkingchoppy.play()	
	if($LabelTimer/GameTimer.time_left < 40):
		$HUDPlanets.speed_scale = 2.5
		if(!_sfx_dying_talkingchoppy2.playing):
			_sfx_dying_talkingchoppy2.play()
	if($LabelTimer/GameTimer.time_left < 30):
		$HUDPlanets.speed_scale = 3.5
		if(!_sfx_dying_radio.playing):
			_sfx_dying_radio.play()	

func _on_label_title_timer_timeout() -> void:
	$Title.hide()
	$LabelMessage/LabelMessageTimer.start()
	
func _on_label_message_timer_timeout() -> void:
	$LabelMessage.show()
	_message_index += 1
	if(_message_index > _messages.size() - 1):
		_message_index = 0
	$LabelMessage/LabelMessageTimer.stop()
	$LabelMessage/LabelMessageTimer.start(_messages[_message_index][1])
	
func _change_video_focus(src: VideoStreamPlayer ) -> void:
	if($VideoStreamPlayerFocus.is_playing() && $VideoStreamPlayerFocus.stream == src.stream):
		$VideoStreamPlayerFocus.stop()
		$VideoStreamPlayerFocus/AudioStreamPlayerFocus.stop()
	else:
		$VideoStreamPlayerFocus/AudioStreamPlayerFocus.stream = load(src.get_child(0).stream.resource_path)
		$VideoStreamPlayerFocus/AudioStreamPlayerFocus.pitch_scale = randf_range(-0.8, 1.2)
		$VideoStreamPlayerFocus/AudioStreamPlayerFocus.play()
		$VideoStreamPlayerFocus.stream = load(src.stream.resource_path)
		$VideoStreamPlayerFocus.play()


func _on_video_change_timer_timeout() -> void:
	if($VideoStreamPlayerFocus.is_playing()):
		_change_video_focus($VideoStreamPlayerFocus)
		$VideoStreamPlayerFocus/VideoChangeTimer.start(randi() % 20 + 1)
	else: 
		_change_video_focus(_videos.pick_random())
		$VideoStreamPlayerFocus/VideoChangeTimer.start(randi() % 3 + 1)


func _on_label_log_timer_timeout() -> void:
	if(_log_index < _logs.size()):
		$LabelTemperature.text += _logs[_log_index][0]
		$LabelTemperature/LabelLogTimer.start(_logs[_log_index][1])
		_log_index += 1
