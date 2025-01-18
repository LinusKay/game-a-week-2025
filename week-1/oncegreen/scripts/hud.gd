extends CanvasLayer

@onready var _heart_sprite = $HUDHeart
@onready var _polyfox_sprite = $HUDPolyfox
@onready var _planet_sprite = $HUDPlanet
@onready var _player = $"../../../../SubViewportContainer/SubViewport/Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_heart_sprite.play("default")
	_polyfox_sprite.play("default")
	_planet_sprite.play("default")
	$LabelVelocity.text = "velocity:" + str(_player.velocity)
	$LabelCoordsX.text = "x:" + str(_player.position.x)
	$LabelCoordsY.text = "y:" + str(_player.position.y)
	$LabelCoordsZ.text = "z:" + str(_player.position.z)

func _on_timer_timeout() -> void:
	$Title.hide()
