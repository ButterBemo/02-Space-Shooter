extends Node

var VP = Vector2.ZERO
var score = 0
var p1_lives = 5
var p2_lives = 5


func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	#VP = get_viewport().size
	VP = Vector2(4000,2748)
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")
	reset()
	
func reset():
	score = 0
	p1_lives = 5
	p2_lives = 5

func _unhandled_input(_event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func _resize():
	#VP = get_viewport().size
	VP = Vector2(4000,2748)


func update_score(s):
	score += s
	var Score = get_node_or_null("/root/Game/UI/HUD/Score")
	if Score != null:
		Score.text = "Score: " + str(score)

func update_lives(l,which_player):
	if which_player == "Player":
		p1_lives += l
	if which_player == "Player2":
		p2_lives += l
	if p1_lives <= 0 or p2_lives <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var P1Lives = get_node_or_null("/root/Game/UI/HUD/P1Lives")
	var P2Lives = get_node_or_null("/root/Game/UI/HUD/P2Lives")
	if P1Lives != null and P2Lives != null:
		P1Lives.text = "P1 Lives: " + str(p1_lives)
		P2Lives.text = "P2 Lives: " + str(p2_lives)
