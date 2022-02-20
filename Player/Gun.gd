extends Node2D

onready var Bullet = load("res://Player/Bullet.tscn")
var ready = true

func shoot(rot, pos):
	if ready:
		var Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var bullet = Bullet.instance()
			Effects.add_child(bullet)
			bullet.rotation = rot
			bullet.global_position = pos
			ready = false
			$Timer.start()


func _on_Timer_timeout():
	ready = true
