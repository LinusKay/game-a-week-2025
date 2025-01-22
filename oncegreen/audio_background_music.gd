extends AudioStreamPlayer

@onready var _timer = $"../SubViewportContainer2/SubViewport/HUD/LabelTimer/GameTimer"
var _changed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(_timer.time_left < 69 && !_changed):
		stream = preload("res://assets/audio/music/knockknock2.ogg")
		play()
		_changed = true		


func _on_music_timer_timeout() -> void:
	play()
	#112s
