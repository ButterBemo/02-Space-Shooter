extends Camera2D

var transition = false
var tweened = false

func _physics_process(_delta):
	var Player1 = get_node_or_null("/root/Game/Player_Container/Player")	
	var Player2 = get_node_or_null("/root/Game/Player_Container/Player2")
	if Player1 != null and Player2 != null:
		var p1 = Player1.global_position
		var p2 = Player2.global_position
		var c = (p1 + p2) / 2
		var vp_size = get_viewport().size.length()
		var p_dist = p1 - p2
		var z = clamp(p_dist.length()*1.8/vp_size,0.5,3)
		if transition and not $Tween.is_active():
			$Tween.interpolate_property(self, "global_position", global_position, c, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.interpolate_property(self, "zoom", zoom, Vector2(z,z), Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()
			transition = false
		elif not $Tween.is_active():
			global_position = c
			zoom = Vector2(z,z)
			tweened = false
	elif not $Tween.is_active() and not tweened:
		var pos = Vector2.ZERO
		if Player1 != null:
			pos = Player1.global_position
		if Player2 != null:
			pos = Player2.global_position
		if pos != Vector2.ZERO:
			$Tween.interpolate_property(self, "global_position", global_position, pos, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.interpolate_property(self, "zoom", zoom, Vector2(1,1), Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		transition = true
		tweened = true
	else:
		if Player1 != null:
			global_position = Player1.global_position
		if Player2 != null:
			global_position = Player2.global_position
