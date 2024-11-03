extends CharacterBody2D

@export var rotationsPerSecond = 1

func _physics_process(delta: float) -> void:
	rotation += rotationsPerSecond * delta * 2 * PI
