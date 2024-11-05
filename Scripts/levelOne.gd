extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func gameOver(condition) -> void:
	print(condition)

func senatorsDepleted() -> void:
	gameOver(0)

func quotaMet() -> void:
	gameOver(1)

func timeOut() -> void:
	gameOver(2)
