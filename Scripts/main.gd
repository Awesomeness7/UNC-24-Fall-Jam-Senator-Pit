extends Node2D

var activeLevel
var pauseMenu: Node2D
var label: Label

var paused = false
var gameActive = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	activeLevel = get_node("./activeLevel")
	pauseMenu = get_node("./pauseMenu")
	label = get_node("./pauseMenu/Label")

	paused = false
	label.text = "Paused"
	pauseMenu.visible = false
	gameActive = true
	activeLevel.get_tree().paused = false
	
func togglePauseMenu() -> void:
	if gameActive:
		paused = !paused
	
		if paused:
			pauseMenu.visible = true
			activeLevel.get_tree().paused = true
		else:
			pauseMenu.visible = false
			activeLevel.get_tree().paused = false
	else:
		get_tree().reload_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("escape"):
		togglePauseMenu()


func gameOver(endCondition: int) -> void:
	gameActive = false
	
	activeLevel.get_tree().paused = true
	if endCondition < 2:
		label.text = "Defeat"
	else:
		label.text = "Victory\nThanks for playing!"
	pauseMenu.visible = true
