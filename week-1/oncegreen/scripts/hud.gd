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
	"This place was green once.",
	"Nothing remains"
]
var _message_index = 0

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

	$LabelMessage.text = _messages[_message_index]
	
	$LabelImplantError.text = "Visual Implant: Fatal Error: " + str(round($LabelTimer/GameTimer.time_left))
	
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
