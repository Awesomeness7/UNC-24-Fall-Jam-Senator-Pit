extends Path2D

@export var duration = 5
@export var points = [Vector2(0, 0), Vector2(100, 0)]

var follow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	follow = get_node("./sawbladePathFollow")
	for point in points:
		curve.add_point(point)
	if (curve.get_point_position(curve.point_count - 1) != curve.get_point_position(0)):
		curve.add_point(points[0])
		print("Straight up 'loopin it'. And by it I mean. My sawblaids.")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	follow.progress_ratio += delta / duration
