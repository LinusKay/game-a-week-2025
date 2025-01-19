extends Area3D

@onready var _video_stream1 = $"../../../SubViewportContainer2/SubViewport/HUD/VideoStreamPlayer"
@onready var _video_stream2 = $"../../../SubViewportContainer2/SubViewport/HUD/VideoStreamPlayer2"
@onready var _video_stream3 = $"../../../SubViewportContainer2/SubViewport/HUD/VideoStreamPlayer3"
@onready var _video_stream4 = $"../../../SubViewportContainer2/SubViewport/HUD/VideoStreamPlayer4"
@onready var _video_stream5 = $"../../../SubViewportContainer2/SubViewport/HUD/VideoStreamPlayer5"

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player": 
		_video_stream1.show()
		_video_stream2.show()
		_video_stream3.show()
		_video_stream4.show()
		_video_stream5.show()
