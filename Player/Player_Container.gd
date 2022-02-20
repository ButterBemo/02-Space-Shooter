extends Node2D

onready var Player = load("res://Player/Player1.tscn")
onready var Player2 = load("res://Player/Player2.tscn")

func _physics_process(_delta):
	var p1 = get_node_or_null("Player")
	var p2 = get_node_or_null("Player2")
	if p1 == null:
		var player = Player.instance()
		player.position = Vector2(Global.VP.x/4, Global.VP.y/2)
		add_child(player)
	if p2 == null:
		var player2 = Player2.instance()
		player2.position = Vector2(3*Global.VP.x/4, Global.VP.y/2)
		add_child(player2)
