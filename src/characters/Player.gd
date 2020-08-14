extends KinematicBody2D

signal laser_shoot
const SPEED := 800

func _physics_process(delta):
	move_and_collide( get_input() * delta )

func _unhandled_key_input(event: InputEventKey):
	if( event.is_action_pressed("shoot")):
		$LaserWeapon.shoot()
		emit_signal("laser_shoot")

func get_input() -> Vector2:
	var velocity := Vector2()
	
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -SPEED
	if (Input.is_action_pressed("ui_right")):
		velocity.x = SPEED
	return velocity


func _on_HitBox_body_entered(body: Node):
	if( !self.is_queued_for_deletion() && body.is_in_group("asteroids") ):
		queue_free()


