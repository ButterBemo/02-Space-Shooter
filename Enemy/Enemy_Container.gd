extends Node2D

onready var Enemy1 = load("res://Enemy/Enemy1.tscn")


var enemy_list = []

var e = 0


func _ready():
	enemy_list = [
		Enemy1
		,Enemy1
		,Enemy1
		,Enemy1
		,Enemy1
		,Enemy1
		,Enemy1
		,Enemy1
		,Enemy1
		,Enemy1
		,null
		,null
		,null
		,null
		,null
		,Enemy1
		,Enemy1
		,Enemy1
	]

func _on_Timer_timeout():
	if e < enemy_list.size():
		if enemy_list[e] != null:		
			var enemy = enemy_list[e].instance()
			add_child(enemy)
		e += 1
