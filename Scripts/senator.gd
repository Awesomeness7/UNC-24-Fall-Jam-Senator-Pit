extends RigidBody2D

var deadSenatorSprite = load("res://Sprites/deadSenator.png")

var state = 0 # 0 = Passive, 1 = dead, 2 = standing up, 3 walking off stage
var hp = 1.0

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	set_contact_monitor(true)
	max_contacts_reported = 10
	
var old_lin_vel: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match (state):
		3:
			rotation -= sign(rotation) * delta * .2
			
			if abs(rotation) < .0005:
				rotation = 0
				state = 3

func die():
	print("Dieded")
	state = 1
	hp = 0.0
	get_node("./Sprite2D").texture = deadSenatorSprite

var positionAtLastCheck
func stillnessCheck() -> void:
	print("Happens")
	if (state == 0):
		if ((position == positionAtLastCheck) && (linear_velocity.length() == 0)):
			print("Raise up!")
			print(rotation)
			state = 2
		else:
			positionAtLastCheck = position


func collisionBegin(intrudingBody: Node2D) -> void:
	if state != 1:
		state = 0
		
		if (intrudingBody.has_meta("Lethality")):
			var force = linear_velocity.distance_to((old_lin_vel))
			match intrudingBody.get_meta("Lethality"):
				1:
					hp -= .34
					hp -= force/1000
					state = 0
			if hp <= 0:
				die()
