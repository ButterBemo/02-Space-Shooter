extends Camera2D

func _ready():
	pass

func _physics_process(_delta):
	var Player1 = get_node_or_null("/root/Game/Player_Container/Player")	
	var Player2 = get_node_or_null("/root/Game/Player_Container/Player2")
	if Player1 != null and Player2 != null:
		var p1 = Player1.global_position
		var p2 = Player2.global_position
		var c = (p1 + p2) / 2
		global_position = c
		var vp_size = get_viewport().size.length()
		var p_dist = p1 - p2
		var z = clamp(p_dist.length()*1.8/vp_size,0.5,3)
		zoom = Vector2(z,z)
