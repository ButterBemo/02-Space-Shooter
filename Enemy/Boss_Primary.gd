extends Node2D

onready var Bullet = load("res://Enemy/Enemy_Bullet.tscn")
var Effects = null
var rot = 0

func _ready():
	pass


func _on_Timer_timeout():
	Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var bullet = Bullet.instance()
		bullet.rotation = rot + PI/2
		bullet.global_position = global_position + Vector2(1000,0).rotated(rot)
		Effects.add_child(bullet)
		rot += 0.1
