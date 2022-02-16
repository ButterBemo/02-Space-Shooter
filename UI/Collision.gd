extends Control

func collide():
	show()
	$Timer.start()

func _on_Timer_timeout():
	hide()
