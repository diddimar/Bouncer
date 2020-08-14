extends Node


var asteroid_scene = load("res://src/objects/Asteroid.tscn")
var damage: float = 10.5


func _ready():
	_spawn_asteroid()


func _spawn_asteroid():
	var asteroid: RigidBody2D = asteroid_scene.instance()

	_set_asteroid_trajectory(asteroid)
	_set_asteroid_position(asteroid)
	add_child(asteroid)


func _set_asteroid_position(asteroid: RigidBody2D):
	var rect = get_viewport().size
	asteroid.position = Vector2(rand_range(0, rect.x), -100)


func _set_asteroid_trajectory(asteroid: RigidBody2D):
	asteroid.angular_velocity = rand_range(-4,4)
	asteroid.angular_damp = 0
	asteroid.linear_damp = 0





func _on_SpawnTimer_timeout():
	_spawn_asteroid()
