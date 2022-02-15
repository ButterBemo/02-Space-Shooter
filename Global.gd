extends Node

const SCORES = "user://scores.sav"
const SECRET = "I LOVE PROJECT 02"

var VP = Vector2.ZERO
var score = 0
var lives = 5

var scores = []


func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")
	reset()
	
func reset():
	score = 0
	lives = 5
	load_scores()

func _unhandled_input(_event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func _resize():
	VP = get_viewport().size


func update_score(s):
	score += s
	var Score = get_node_or_null("/root/Game/UI/HUD/Score")
	if Score != null:
		Score.text = "Score: " + str(score)

func update_lives(l):
	lives += l
	if lives <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var Lives = get_node_or_null("/root/Game/UI/HUD/Lives")
	if Lives != null:
		Lives.text = "Lives: " + str(lives)

func add_score():
	var temp = []
	var trailer = 10000000000
	var added = false
	for s in scores:
		if score < trailer and score > s["score"]:
			temp.append({"score":score, "date":OS.get_datetime()})
			added = true
		temp.append(s)
		trailer = s["score"]
	if not added:
		temp.append({"score":score, "date":OS.get_datetime()})
	scores = temp
	save_scores()
	
	

func load_scores():
	var save_scores = File.new()
	if not save_scores.file_exists(SCORES):
		return
	
	save_scores.open_encrypted_with_pass(SCORES, File.READ, SECRET)
	var contents = save_scores.get_as_text()
	var json_contents = JSON.parse(contents)
	if json_contents.error == OK:
		scores = json_contents.result
	save_scores.close()

func save_scores():
	var save_scores = File.new()
	save_scores.open_encrypted_with_pass(SCORES, File.WRITE, SECRET)
	save_scores.store_string(to_json(scores))
	save_scores.close()

