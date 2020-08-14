extends Camera2D

# ScreenShake.start() variable arguments:
# duration = 0.2, frequency = 15, amplitude = 16, priority = 0

func _on_Player_laser_shoot():
	$ScreenShake.start(0.1, 15, 4, 0)

func asteroid_exploded():
	$ScreenShake.start(0.1, 15, 14, 2)

func asteroid_small_exploded():
	$ScreenShake.start(0.1, 15, 12, 1)

