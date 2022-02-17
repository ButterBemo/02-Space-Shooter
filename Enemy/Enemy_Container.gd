extends Node2D

onready var Enemy = load("res://Enemy/Enemy.tscn")
onready var Boss = load("res://Enemy/Boss.tscn")

func _physics_process(_delta):
	pass
	#if get_child_count() == 0:
	#	var enemy = Enemy.instance()
	#	enemy.position = Vector2(randf()*Global.VP.x, randf()*Global.VP.y)
	#	add_child(enemy)


func _on_Timer_timeout():
	var boss = Boss.instance()
	boss.name = "Boss"
	add_child(boss)
