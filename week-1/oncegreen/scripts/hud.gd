extends CanvasLayer

@onready var _heart_sprite = $HUDHeart
@onready var _polyfox_sprite = $HUDPolyfox
@onready var _planet_sprite = $HUDPlanet
@onready var _eye_sprite = $HUDEye
@onready var _xray_sprite = $HUDXray

@onready var _player = $"../../../SubViewportContainer/SubViewport/Player"
@onready var _sfx_dying_radio = $"../../../AudioBackgroundMusic/SFXAlienRadio"
@onready var _sfx_dying_talkingchoppy = $"../../../AudioBackgroundMusic/SFXTalkingChoppy"
@onready var _sfx_dying_talkingchoppy2 = $"../../../AudioBackgroundMusic/SFXTalkingChoppy2"

var _messages = [
	["Connection lost.", 1],
	["Connection lost. .", 1],
	["Connection lost. . .", 1],
	["!Temperature overload", 1],
	["This place was green once", 1],
	["Primaris, Tolaris, Orus orbit a dead planet.", 5],
	["Nahboris' winds long for contact.", 5],
	["", 2],
	["Trees", 1],
	["Leaves", 1],
	["Life", 1],
	["Nobody to tell of these things.", 5],
	["!Temperature overload", 1],
	["", 2],
	["High impact displays ", 1],
	["Implants beyond the Altun limit turned flesh to waste.", 1],
	["Trafficked psycho-severants leave the mental in bits.", 1],
	["Nobody to tell of these things.", 5],
	["A mother kisses her child, as they leave for school.", 3],
	["Fires burn in a capital.", 3],
	["", 2],
	["This place was green once.", 5],
	["!Temperature overload", 1],
	["This", .1],
	["place", .1],
	["was", .1],
	["green", .1],
	["once", .1],
	["This", .1],
	["place", .1],
	["was", .1],
	["green", .1],
	["once", .1],
	["goodbye", .5],
	["This", .1],
	["place", .1],
	["was", .1],
	["green", .1],
	["once", .1],
	["let your HUD lull you asleep", .5],
	["This", .1],
	["place", .1],
	["was", .1],
	["green", .1],
	["once", .1],
	
]
var _message_index = 0

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
	_eye_sprite.play("default")
	_xray_sprite.play("default")
	
	$LabelVelocity.text = "velocity:" + str(_player.velocity)
	$LabelCoordsX.text = "x:" + str(_player.position.x)
	$LabelCoordsY.text = "y:" + str(_player.position.y)
	$LabelCoordsZ.text = "z:" + str(_player.position.z)

	$LabelMessage.text = _messages[_message_index][0]
	
	$LabelImplantError.text = "Visual Implant: Fatal Error: " + str(round($LabelTimer/GameTimer.time_left))
		
	if($LabelTimer/GameTimer.time_left < 289):
		$VideoStreamPlayer.show()		
	if($LabelTimer/GameTimer.time_left < 288):
		$VideoStreamPlayer2.show()
	if($LabelTimer/GameTimer.time_left < 287):
		$VideoStreamPlayer3.show()
	if($LabelTimer/GameTimer.time_left < 286):
		$VideoStreamPlayer4.show()
	if($LabelTimer/GameTimer.time_left < 285):
		$VideoStreamPlayer5.show()	
	if($LabelTimer/GameTimer.time_left < 200):
		$VideoStreamPlayerFocus.show()
	if($LabelTimer/GameTimer.time_left < 60):
		if(!_sfx_dying_talkingchoppy.playing):
			_sfx_dying_talkingchoppy.play()	
	if($LabelTimer/GameTimer.time_left < 40):
		if(!_sfx_dying_talkingchoppy2.playing):
			_sfx_dying_talkingchoppy2.play()
	if($LabelTimer/GameTimer.time_left < 30):
		if(!_sfx_dying_radio.playing):
			_sfx_dying_radio.play()	

func _on_label_title_timer_timeout() -> void:
	$Title.hide()
	$LabelMessage.show()
	$LabelMessage/LabelMessageTimer.start()
	
func _on_label_message_timer_timeout() -> void:
	_message_index += 1
	if(_message_index > _messages.size() - 1):
		_message_index = 0
	$LabelMessage/LabelMessageTimer.stop()
	$LabelMessage/LabelMessageTimer.start(_messages[_message_index][1])
	
func _change_video_focus(src: VideoStreamPlayer ) -> void:
	if($VideoStreamPlayerFocus.is_playing() && $VideoStreamPlayerFocus.stream == src.stream):
		$VideoStreamPlayerFocus.stop()
	else:
		$VideoStreamPlayerFocus.stream = load(src.stream.resource_path)
		$VideoStreamPlayerFocus.play()


func _on_video_change_timer_timeout() -> void:
	if($VideoStreamPlayerFocus.is_playing()):
		$VideoStreamPlayerFocus.stop()
		$VideoStreamPlayerFocus/VideoChangeTimer.start(randi() % 20 + 1)
	else: 
		print(_videos.pick_random())
		_change_video_focus(_videos.pick_random())
		$VideoStreamPlayerFocus/VideoChangeTimer.start(randi() % 3 + 1)
