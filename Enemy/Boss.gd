extends KinematicBody2D

var pos = 0
var positions = [
	Vector2(5000,1000)
	,Vector2(5000,2500)
	,Vector2(1000,2500)
	,Vector2(1000,1000)
]

var health = 1000.0
var max_health = 1000.0
var score = 1000

func _ready():
	var player_camera = get_node_or_null("/root/Game/Player_Container/Player/Camera2D")
	if player_camera != null:
		$Camera2D.global_position = player_camera.global_position
		$Camera2D.zoom = player_camera.zoom
		$Camera2D/Tween.interpolate_property($Camera2D, "global_position", $Camera2D.global_position, global_position, 3, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Camera2D/Tween.interpolate_property($Camera2D, "zoom", $Camera2D.zoom, Vector2(5,5), 3, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Camera2D/Tween.start()
	$Camera2D.current = true
	global_position = Vector2(1000,1000)
	var Boss_Health = get_node_or_null("/root/Game/UI/HUD/Boss_Health")
	if Boss_Health != null:
		Boss_Health.show()	
	$Tween.interpolate_property(self, "position", position, positions[pos], 2.0, Tween.TRANS_EXPO, Tween.EASE_IN, 5.0)
	$Tween.start()
	pos = wrapi(pos + 1, 0, positions.size())


func _on_Timer_timeout():
	pass # Replace with function body.

func damage(d):
	health -= d
	var Boss_Health = get_node_or_null("/root/Game/UI/HUD/Boss_Health")
	if Boss_Health != null:
		Boss_Health.value = (health/max_health)*100
		if health <= 0:
			Boss_Health.hide()
	if health <= 0:
		Global.update_score(score)
		queue_free()

func _on_Tween_tween_all_completed():
	$Tween.interpolate_property(self, "position", position, positions[pos], 2.0, Tween.TRANS_EXPO, Tween.EASE_IN)
	$Tween.start()
	pos = wrapi(pos + 1, 0, positions.size())

