extends Node2D

onready var Player = load("res://Player/Player.tscn")
var respawning = false
var ready = true

func _physics_process(_delta):
	if get_child_count() == 0:
		if not respawning and not ready:
			var time = get_node_or_null("/root/Game/Respawn")
			if time != null:
				respawning = true
				time.start()
		if ready:
			var player = Player.instance()
			player.position = Vector2(Global.VP.x/2, Global.VP.y/2)
			add_child(player)
			ready = false


func _on_Respawn_timeout():
	respawning = false
	ready = true
