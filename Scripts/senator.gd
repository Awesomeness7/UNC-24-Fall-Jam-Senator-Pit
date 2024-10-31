extends RigidBody2D

var deadSenatorSprite = load("res://Sprites/deadSenator.png")

var alive = true
var hp = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func die():
	print("Dieded")
	alive = false
	hp = 0.0
	get_node("./Sprite2D").texture = deadSenatorSprite

func hitboxIntruded(body: Node2D) -> void:
	if alive:
		if (body.has_meta("Lethality")):
			match body.get_meta("Lethality"):
				1:
					hp -= .7
		if hp <= 0:
			die()
