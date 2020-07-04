extends Spatial

var velocity = Vector3.FORWARD
var angular_acceleration = 10
var speed = 0

func _physics_process(delta):
	if (Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_down")):
		speed = 0.5
		velocity = Vector3(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
							0,
							Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")).normalized()
	else:
		speed = 0
	
	$Label.text = "rotation : " + String(rad2deg(atan2(-velocity.x, -velocity.z)))

	$player/mesh.rotation.y = lerp_angle($player/mesh.rotation.y, atan2(-velocity.x, -velocity.z), delta * angular_acceleration)

	$player.move_and_slide(velocity * speed, Vector3.UP)

