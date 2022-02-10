extends Camera2D

var transition = false

func _physics_process(_delta):
	var Player = get_node_or_null("/root/Game/Player_Container/Player")
	var Enemy = get_node_or_null("/root/Game/Enemy_Container/Enemy")
	if Player == null or Enemy == null:
		if not $Tween.is_active():
			$Tween.interpolate_property(self, "global_position", global_position, Enemy.global_position, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.interpolate_property(self, "zoom", zoom, Vector2(1,1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()
		transition = true
	else:
		var pp = Player.global_position
		var ep = Enemy.global_position
		if pp != null and ep != null:
			var dist = (pp + ep) / 2
			var s = Global.ViewPort.length()
			var l = pp - ep
			var z = clamp(l.length()*1.8 / s, 0.5, 1.3)
			var pixels = z * Global.ViewPort
			
			if transition and not $Tween.is_active():
				$Tween.interpolate_property(self, "global_position", global_position, dist, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
				$Tween.interpolate_property(self, "zoom", zoom, Vector2(z,z), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
				$Tween.start()
				transition = false
			elif not $Tween.is_active():
				global_position 
				global_position = dist
				zoom = Vector2(z,z)
