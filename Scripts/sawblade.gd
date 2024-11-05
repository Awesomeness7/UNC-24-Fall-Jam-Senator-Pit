extends CharacterBody2D

var animation

func _ready() -> void:
	animation = $AnimationPlayer
	animation.play("spinny")

func _physics_process(delta: float) -> void:
	pass
