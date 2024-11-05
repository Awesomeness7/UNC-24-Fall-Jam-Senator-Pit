extends CharacterBody2D

var animation
var collisionShape

@export var angular_velocity = 1

func _ready() -> void:
	animation = $AnimationPlayer
	collisionShape = $CollisionShape2D
	
	animation.play("spinny")

func _physics_process(delta: float) -> void:
	collisionShape.rotation += angular_velocity
