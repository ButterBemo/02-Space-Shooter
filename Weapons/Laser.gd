extends RayCast2D

var is_casting = false setget set_is_casting

var damage = 0.1


func _ready():
	set_physics_process(false)
	$Line2D.points[1] = Vector2.ZERO


func _process(delta):
	if Input.is_action_pressed("shoot"):
		if not self.is_casting:
			self.is_casting = true
	elif self.is_casting:
		self.is_casting = false


func _physics_process(delta):
	var cast_point = cast_to
	force_raycast_update()
	
	$Impact.emitting = is_colliding()
	
	if is_colliding():
		cast_point = to_local(get_collision_point())
		$Impact.position = cast_point
		$Impact.global_rotation = get_collision_normal().angle()
		var body = get_collider()
		if body.has_method("damage"):
			body.damage(damage)
	
	$Line2D.points[1] = cast_point
	$Beam.position = cast_point * 0.5
	$Beam.process_material.emission_box_extents.x = cast_point.length() * 0.5


func set_is_casting(cast):
	is_casting = cast
	
	$Emitting.emitting = is_casting
	$Beam.emitting = is_casting
	
	if is_casting:
		appear()
	else:
		$Impact.emitting = false
		disappear()
	set_physics_process(is_casting)



func appear():
	$Tween.stop_all()
	$Tween.interpolate_property($Line2D, "width", 0, 10, 0.2)
	$Tween.start()


func disappear():
	$Tween.stop_all()
	$Tween.interpolate_property($Line2D, "width", 10, 0, 0.1)
	$Tween.start()
