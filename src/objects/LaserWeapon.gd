extends Node2D

var laser_scene := load("res://src/objects/Laser.tscn")


func shoot():
	var laser =laser_scene.instance()
	laser.global_position = global_position
	get_node("/root/Game").add_child(laser)
