extends RigidBody2D

signal explode

var asteroid_small_scene := load("res://src/objects/AsteroidSmall.tscn")
var rng = RandomNumberGenerator.new()
var is_exploded := false

func _ready():
	var main_camera = get_node("/root/Game/MainCamera")
	connect("explode", main_camera, "asteroid_exploded")


func explode():
	if is_exploded:
		return

	is_exploded = true
	emit_signal("explode")

	_spawn_asteroids_small(4)

	get_parent().remove_child(self)
	queue_free()


func _spawn_asteroids_small(num: int):
	for i in range(num):
		_spawn_single_asteroid_small()


func _spawn_single_asteroid_small():
	var asteroid_small = asteroid_small_scene.instance()
	asteroid_small.position = position
	_randomize_trajectory(asteroid_small)
	get_parent().add_child(asteroid_small)


func _randomize_trajectory(asteroid: RigidBody2D):
	# Random spin
	asteroid.angular_velocity = rand_range(-4,4)
	asteroid.angular_damp = 0

	# randomly choose -1, 0 or 1
	rng.randomize()
	var lv_x = rng.randf_range(-1,1)
	var lv_y = rng.randf_range(-1,1)

	var multiplier := 400
	# Random direction
	asteroid.linear_velocity = Vector2(lv_x * multiplier, lv_y * multiplier)
	asteroid.linear_damp = 0


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
