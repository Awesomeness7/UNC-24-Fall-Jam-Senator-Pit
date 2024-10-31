extends CharacterBody2D

@export var angular_velo = 0.3

func _physics_process(delta: float) -> void:
	rotation += angular_velo
