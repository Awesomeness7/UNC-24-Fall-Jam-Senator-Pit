extends Node2D

@export var duration: int = 123

var timeRemainingLabel

var timeRemaining: float = 0
var timerRunning: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timeRemaining = duration
	timeRemainingLabel = get_node("./timeRemaining")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timerRunning:
		timeRemaining -= delta
	
		if timeRemaining > 10:
			timeRemainingLabel.text = "%d:%02d" % [(int(timeRemaining) / 60), int (timeRemaining) % 60]
		elif ((timeRemaining <= 10) && (timeRemaining > 0)):
			timeRemainingLabel.text = "%0.2f" % timeRemaining
		elif (timeRemaining <= 0):
			timeRemainingLabel.text = "0:00"
			print("YER DONE!")
			timerRunning = false
