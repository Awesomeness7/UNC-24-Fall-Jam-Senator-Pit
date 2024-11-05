extends Node2D

signal quotaReached

@export var quota = 30 
@onready var text = $text

var numDeadSenators = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func senatorKilled() -> void:
	numDeadSenators += 1
	
	text.text = "%2d/%2d" % [numDeadSenators, quota]

	if (numDeadSenators == quota):
		quotaReached.emit()


func senatorDies() -> void:
	pass # Replace with function body.
