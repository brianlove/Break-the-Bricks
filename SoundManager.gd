extends Node2D

@onready var break_brick_audio: AudioStreamPlayer2D = $BreakBrickAudio
@onready var bounce_audio: AudioStreamPlayer2D = $BounceAudio

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func bounce() -> void:
	bounce_audio.play()


func break_brick() -> void:
	break_brick_audio.play()
