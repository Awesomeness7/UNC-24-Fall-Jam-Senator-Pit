extends RigidBody2D

const GRAVITY = 300.0

var deadSenatorSprite = load("res://Sprites/tempDeadSenator.bmp")

# Crucial multipurpose variables
var state: int = 0 # 0 = Passive, 1 = dead, 2 = standing up, 3 walking off stage
var hp: float = 1.0
var old_lin_vel: Vector2

# Used for checking if a passive, living senator is at rest, which will trigger him to stand.
var positionAtLastCheck = Vector2(0,0)

# Used for standing up
var feetPositionInitial: Vector2
var feetPositionCurrent: Vector2

func _ready() -> void:
	pass
	# set_contact_monitor(true)
	# max_contacts_reported = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func die():
	state = 1
	hp = 0.0
	var sprite = get_node("./Sprite2D")
	sprite.texture = deadSenatorSprite
	sprite.hframes = 1

func stillnessCheck() -> void:
	if (state == 0):
		if (((position - positionAtLastCheck).length() < 0.0005) && (linear_velocity.length() < 0.0005)):
			if (true): # Code for checking if the senator is uncovered
				state = 2
		else:
			positionAtLastCheck = position

func collisionBegin(intrudingBody: Node2D) -> void:
	if state != 1:
		print(intrudingBody.name)
		state = 0
		
		if (intrudingBody.has_meta("Lethality")):
			match intrudingBody.get_meta("Lethality"):
				1:
					hp -= 1
					state = 0
			if hp <= 0:
				die()
