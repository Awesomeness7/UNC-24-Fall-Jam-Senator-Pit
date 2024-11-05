extends Node2D

signal senatorsDepleted

@export var senatorsRemaining: int

var senatorsRemainingLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	senatorsRemainingLabel = get_node("./senatorsRemaining")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func senatorPlaced():
	if senatorsRemaining > 0:
		senatorsRemaining -= 1
		senatorsRemainingLabel.text = "%02d" % senatorsRemaining
	elif senatorsRemaining == 0:
		senatorsDepleted.emit()
