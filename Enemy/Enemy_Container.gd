extends Node2D

onready var Enemy = load("res://Enemy/Enemy.tscn")

func _physics_process(_delta):
	if get_child_count() == 0:
		var enemy = Enemy.instance()
		enemy.position = Vector2(1000,1000)
		add_child(enemy)
