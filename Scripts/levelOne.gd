extends Node2D

signal gameOver(endCondition: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func senatorsDepleted() -> void:
	print("NO MORE SENATORS!")
	gameOver.emit(0)

func timeOut() -> void:
	gameOver.emit(1)

func quotaMet() -> void:
	gameOver.emit(2)
