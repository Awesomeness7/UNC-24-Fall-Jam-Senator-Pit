extends Node2D

var activeLevel
var pauseMenu: Node2D

var paused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	activeLevel = get_node("./activeLevel")
	pauseMenu = get_node("./pauseMenu")
	
func togglePauseMenu() -> void:
	paused = !paused
	
	if paused:
		pauseMenu.visible = true
	else:
		pauseMenu.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("escape"):
		togglePauseMenu()
