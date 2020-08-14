extends Area2D

var direction := Vector2.UP
var projectile_speed := 1000

func _process(delta):
	position += direction * projectile_speed * delta

# Area2D Node does not interact with the physics engine
# So use the "_process" function to update movement code
# instead of the "_physics_process" function


func _on_Laser_body_shape_entered(body_id, body, body_shape, area_shape):
	if !self.is_queued_for_deletion() && body.is_in_group("asteroids"):
		body.call_deferred("explode") #--> call method during idle processing time

		get_parent().remove_child(self)
		queue_free()



func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()

