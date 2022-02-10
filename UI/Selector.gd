extends Control

func _ready():
	pass


func _on_ShipB_pressed():
	Global.Player = load("res://Player/ShipB.tscn")
	var _scene = get_tree().change_scene("res://Game.tscn")


func _on_ShipC_pressed():
	Global.Player = load("res://Player/ShipC.tscn")
	var _scene = get_tree().change_scene("res://Game.tscn")


func _on_ShipG_pressed():
	Global.Player = load("res://Player/ShipG.tscn")
	var _scene = get_tree().change_scene("res://Game.tscn")
