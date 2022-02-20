extends KinematicBody2D

var positions = [
	Vector2(Global.VP.x/2, -100)
	,Vector2(300,200)
	,Vector2(500,200)
	,Vector2(500,400)
	,Vector2(100,400)
	,Vector2(100,800)
	,Vector2(500,800)
	,Vector2(1000,800)
]
var p = 0
var health = 5
var score = 1

onready var Bullet = load("res://Enemy/Enemy_Bullet.tscn")

func _ready():
	position = positions[p]
	$Tween.interpolate_property(self, "position", positions[p], positions[p+1], 3.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0)
	$Tween.start()
	p += 1


func _on_Tween_tween_all_completed():
	if p+1 >= positions.size():
		queue_free()
	else:
		$Tween.interpolate_property(self, "position", positions[p], positions[p+1], 3.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0)
		$Tween.start()
		p += 1

func damage(d):
	health -= d
	if health <= 0:
		Global.update_score(score)
		queue_free()


func _on_Timer_timeout():
	var Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var bullet = Bullet.instance()
		bullet.global_position = global_position + Vector2(0, 50)
		bullet.rotation = PI
		Effects.add_child(bullet)
	
