extends Node2D

var Senator = load("res://Scenes/senator.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func clickDetectedInClickArea(event: InputEvent) -> void:
	if (event is InputEventMouseButton) and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var senator = Senator.instantiate()
		senator.position = get_local_mouse_position();
		add_child(senator)
