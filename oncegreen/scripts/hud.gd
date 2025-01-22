extends CanvasLayer

@onready var _planet_sprite = $HUDPlanet
@onready var _xray_sprite = $HUDXray
@onready var _planets_sprite = $HUDPlanets
@onready var _cross_sprite = $HUDCross

@onready var _player = $"../../../SubViewportContainer/SubViewport/Player"
@onready var _sfx_dying_talkingchoppy = $"../../../AudioBackgroundMusic/SFXTalkingChoppy"
@onready var _sfx_dying_talkingchoppy2 = $"../../../AudioBackgroundMusic/SFXTalkingChoppy2"

@onready var _ui_sfx1 = preload("res://assets/audio/sfx/TF_GUI-Sound-11.ogg")
@onready var _ui_sfx2 = preload("res://assets/audio/sfx/TF_Meep.ogg")
@onready var _ui_sfx_log = preload("res://assets/audio/sfx/Granular Synthesis BTN Sound.wav")

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
	["\nmessages incoming", 2],
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
	["CLEAR", 1],
	["\nRestarting Services", 5],
	["*", 1],
	["*", 1],
	["*", .1],
	["*", .1],
	["*", 1],
	["\nUnable to restart", 2],
	["\n!error", .1],
	["\nSTAT: (0x78a1) IMP error: visor_a3df98", 2],
	["\n!error", .1],
	["\n!error", .2],
	["\n!error", .1],
	["\n!error", .1],
	["\n!error", .4],
	["\nstart x_888894 --overtime -i 24", 2],
	["\n[235]-90234", .1],
	["\n[874]-46244", .5],
	["\n[275]94768", 1],
	["\n[146]75675", .3],
	["\n[000]00000", .3],
	["\n[000]00000", .1],
	["\n[000]00000", 0],
	["\n[000]00000", 0],
	["\n[000]00000", 5],
	["CLEAR", .1],
	["\nREDREDREDREDREDREDR", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["\nEDREDREDREDREDREDRE", .1],
	["\nDREDREDREDREDREDRED", .1],
	["CLEAR", .1],
	["\nPROC_REPORT:", 2],
	["\nproc [pid] [tok] [%%%] [run]:", 1],
	["\nnmon [13667] [a4b73d] [03%] [y]:", 1],
	["\nprimaris_lnk [23558] [45d851] [07%] [n]:", .5],
	["\norus_lnk [23560] [e37812] [17%] [n]:", 2],
	["\n-", 2],
	[" -", 2],
	[" -", 2],
	[" -", .1],
	["\nexit: (0x79d1) corrupt sector", 1],
	["\nstall - is sys ok?", 1],
	["\n!error", .1],
	["\nstall - is sys ok?", 1],
	["\n!error", 3],
	["\n!error", .2],
	["\n!error", .1],
	["\n!error", .1],
	["\n!error", .4],
	["CLEAR", .1],
	["\n%#)@&#^%^&#&%^&)#)@", .1],
	["\n##%#%%##%###&&&$$$&", .1],
	["\n#!!!#%%#@@#^(*%%&&)", .1],
	["\n))!@#$%&#^%@#^#%^%%", .1],
	["\n!**($^&^&$^&#@$$^^&@", .1],
	["\n()@#*%&@^%)@#&*%^^%^", .1],
	["\n##########planet####", .1],
	["\n%^^&%#&^&@%)&@#)^&*%", .1],
	["\n@@!*(!!&*($%&($&$)))", .1],
	["\n!!!!!!!!!!!!!!!!!!!!", .1],
	["\n*%*&@#*%*(#&*%&*(*))", .1],
	["\nERRORERRORERRORERROR", .1],
	["\n#!!!#%%#@@#^(*%%&&)", .1],
	["\n%^^&%#&^&@%)&@#)^&*%", .1],
	["\n))!@#$%&#^%@#^#%^%%", .1],
	["\n##%#%%##%###&&&$$$&", .1],
	["\n#####dead##########", 1],
	["\n()@#*%&@^%)@#&*%^^%^", .1],
	["\n@@!*(!!&*($%&($&$)))", .1],
	["\n#!!!#%%#@@#^(*%%&&)#", .1],
	["\n##########howl######", 1],
	["\n*%*&@#*%*(#&*%&*(*))", .1],
	["\nERRORERRORERRORERROR", 3.5],
	["CLEAR", .1],
	["", 9],
	["\n* .* *   *   *  .  *", 1],
	["\n. . ` * .   . ` *   ", 1],
	["\n. * . ` * .   * ` * ", 1],
	["\n   . * . ` * ,   . *", 1],
	["\n `   . . ` . ,  * ", 1],
	["\n. * . ` * .   * ` * ", 1],
	["\n* .* *   *   *  .  *", 1],
	["\n `   . . ` . ,  * ", 1],
	["\n* .* *   *   *  .  *", 1],
	["\n. . ` * .   . ` *   ", 1],
	["\n. * . ` * .   * ` * ", 1],
	["\n   . * . ` * ,   . *", 1],
	["\n `   . . ` . ,  * ", 1],
	["\n. * . ` * .   * ` * ", 1],
	["\n* .* *   *   *  .  *", 1],
	["\n `   . . ` . ,  * ", 7.6],
	["CLEAR", 10],
	["", 28.5],
	["\nyou are dying", 1],
	["CLEAR", 10],
	["", 15],
	["transmission incoming", 5],
	["\nstreaming", 1],
	["\nstreaming", 1],
	["\nstreaming", 1],
	["\nstreaming", 1],
	["\nstreaming", 1],
]
var _log_index = 0

var _messages = [
	["This place was green once", 5],
	["", 5],
	["Primaris, Tolaris, Orus orbit a dead planet.", 5],
	["", 5],
	["When man fell to rust and chemical", 5],
	["", 1],
	["all they left was red.", 3],
	["", 10],
	["From the grave, a great collosi howls.", 5],
	["", 1],
	["The groans of an earthen behemoth.", 5],
	["", 2],
	["Red Nahboris' winds long for contact.", 5],
	["", 10],
	["The dust that drifts on her surface begs to be ingested.", 5],
	["", 1],
	["To crawl its way into every orifice", 5],
	["", 1],
	["To pool in every pit", 3],
	["", 10],
	["Nahboris' mantle", 2],
	["", 1],
	["which spits fire and hellish plumes,", 5],
	["", 1],
	["which screams with banshee wind.", 4],
	["", 1],
	["whose miles-deep flesh covets a cosmic heart.", 5],
	["", 5],
	["upon this surface", 2],
	["!Temperature overload", .5],
	["dying.", .5],
	["you are dying.", .5],
	["you are going to die.", 1],
	["", 10],
	["This place was green once", 5],
	["", 10],
	["A house sits by the coast of the Ingmar.", 5],
	["Soft breezes caress earthen limbs", 5],
	["carrying Gull-call.", 2],
	["", 5],
	["Valleys and troughs spill out across Kjoller", 5],
	["winding serpentine tendrils of water", 4],
	["", 2],
	["Nobody to tell of these things.", 2],
	["you are dying.", .5],
	["This place was green once", 5],
	["", 2],
	["I", 1],
	["I was green once", 3],
	["This place was green once", 5],
	["Primaris, Tolaris, Orus orbit a dead planet.", 5],
	["all they left was red", 5],
	["red", 2],
	["r", .1],
	["re", .1],
	["red", .1],
	["redr", .1],
	["redre", .1],
	["redred", .1],
	["redredr", .1],
	["redredre", .1],
	["redredred", .1],
	["redredredr", .1],
	["redredredre", .1],
	["redredredred", .1],
	["redredredredr", .1],
	["!Temperature overload", .1],
	["redredredredre", .1],
	["redredredredred", .1],
	["redredredredredr", .1],
	["redredredredredre", .1],
	["redredredredredred", .1],
	["redredredredredredr", .1],
	["redredredredredredre", .1],
	["redredredredredredred", .1],
	["redredredredredredredr", .1],
	["redredredredredredredre", .1],
	["redredredredredredredred", .1],
	["This place was green once", .1],
	["redredredredredredredredr", .1],
	["redredredredredredredredre", .1],
	["redredredredredredredredred", .1],
	["redredredredredredredredredr", .1],
	["redredredredredredredredredre", .1],
	["redredredredredredredredredred", .1],
	["redredredredredredredredredredr", .1],
	["redredredredredredredredredredre", .1],
	["redredredredredredredredredredred", .1],
	["This place was green once", 1],
	["rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr", .1],
	["eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee", .1],
	["ddddddddddddddddddddddddddddddddd", .1],
	["nahborisnahborisnahborisnahboris", .1],
	["Thi# pl&%% was g!$een onc4", .01],
	["T#is place was gr#&^ once", .01],
	["!!!@ place was gr$#!n on)()", 01],
	["Th!% %#%!% w)( green !*()", .01],
	["##########################", .01],
]
var _message_index = 0
# 55s

var _message_sounds = [
	preload("res://assets/audio/sfx/whisper1.ogg"),
	preload("res://assets/audio/sfx/whisper2.ogg"),
	preload("res://assets/audio/sfx/whisper3.ogg"),
	preload("res://assets/audio/sfx/whisper4.ogg"),
	preload("res://assets/audio/sfx/whisper5.ogg"),
	preload("res://assets/audio/sfx/whisper6.ogg"),
	preload("res://assets/audio/sfx/whisper7.ogg"),
	preload("res://assets/audio/sfx/whisper8.ogg"),
]
var _message_sound_index = 0

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
	#var seconds = 0
	#for x in _logs.size():
		#if(x<_log_index):
			#seconds += _logs[x][1]
	#print(seconds)
	
	_planet_sprite.play("default")
	_xray_sprite.play("default")
	_planets_sprite.play("default")
	
	$LabelVelocity.text = "velocity:" + str(_player.velocity)
	$LabelCoordsX.text = "x:" + str(_player.position.x)
	$LabelCoordsY.text = "y:" + str(_player.position.y)
	$LabelCoordsZ.text = "z:" + str(_player.position.z)
	
	$LabelImplantError.text = "Visual Implant: Fatal Error: " + str(round($LabelTimer/GameTimer.time_left))

	if($LabelTimer/GameTimer.time_left < 280):
		if(!$HUDXray.is_visible_in_tree()):
			$HUDXray.show()	
			$HUDAudio.stream = _ui_sfx2
			$HUDAudio.play()
	if($LabelTimer/GameTimer.time_left < 255):
		if(!$LabelImplantError.is_visible_in_tree()):
			$LabelImplantError.show()	
			$HUDAudio.stream = _ui_sfx2
			$HUDAudio.play()
	var _video_popup = 100
	if($LabelTimer/GameTimer.time_left < _video_popup):
		if(!$VideoStreamPlayer.is_visible_in_tree()):
			$VideoStreamPlayer.show()		
			$HUDAudio.stream = _ui_sfx1
			$HUDAudio.play()
	if($LabelTimer/GameTimer.time_left < _video_popup - 1):
		if(!$VideoStreamPlayer2.is_visible_in_tree()):
			$VideoStreamPlayer2.show()	
			$HUDAudio.stream = _ui_sfx1
			$HUDAudio.play()
	if($LabelTimer/GameTimer.time_left < _video_popup - 2):
		if(!$VideoStreamPlayer3.is_visible_in_tree()):
			$VideoStreamPlayer3.show()	
			$HUDAudio.stream = _ui_sfx1
			$HUDAudio.play()
	if($LabelTimer/GameTimer.time_left < _video_popup - 3):
		if(!$VideoStreamPlayer4.is_visible_in_tree()):
			$VideoStreamPlayer4.show()	
			$HUDAudio.stream = _ui_sfx1
			$HUDAudio.play()
	if($LabelTimer/GameTimer.time_left < _video_popup - 4):
		if(!$VideoStreamPlayer5.is_visible_in_tree()):
			$VideoStreamPlayer5.show()		
			$HUDAudio.stream = _ui_sfx1
			$HUDAudio.play()
	if($LabelTimer/GameTimer.time_left < 80):
		$VideoStreamPlayerFocus.show()	
		if($VideoStreamPlayerFocus/VideoChangeTimer.is_stopped()):
			$VideoStreamPlayerFocus/VideoChangeTimer.start()
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
		#if(!_sfx_dying_radio.playing):
			#_sfx_dying_radio.play()	

func _on_label_title_timer_timeout() -> void:
	$Title.hide()
	$LabelMessage/LabelMessageTimer.start()
	
func _on_label_message_timer_timeout() -> void:
	$HUDMessageAudio.stop()
	if(!$LabelMessage.is_visible_in_tree()):
		$LabelMessage.show()
	else:
		_message_index += 1
		if(_message_index > _messages.size() - 1):
			_message_index = 0
	$LabelMessage.text = _messages[_message_index][0]
	$LabelMessage/LabelMessageTimer.stop()
	$LabelMessage/LabelMessageTimer.start(_messages[_message_index][1])
	if($LabelMessage.text != ""):
		print($LabelMessage.text)
		$HUDMessageAudio.stream = _message_sounds[_message_sound_index]
		$HUDMessageAudio.play()
		_message_sound_index += 1
		if(_message_sound_index > _message_sounds.size() - 1):
			_message_sound_index = 0
	
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
		print(_logs[_log_index][0])
		if(_logs[_log_index][0] == "CLEAR"):
			$LabelTemperature.text = ""
			_log_index += 1
		$LabelTemperature.text += _logs[_log_index][0]
		$LabelTemperature/LabelLogTimer.start(_logs[_log_index][1])
		_log_index += 1
		$HUDAudio.stream = _ui_sfx_log
		$HUDAudio.play()
		# remove first log index, fake scroll
		if($LabelTemperature.text.count('\n') > 37):
			var index = $LabelTemperature.text.find('\n')
			if index != -1:
				$LabelTemperature.text = $LabelTemperature.text.substr(index + 1)
