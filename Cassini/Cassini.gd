""" A rather messy script that does all the animation.
This includes things like:
	- Rotating the camera
	- Animating the level of "heating" of the plasma bubble

"""
extends Spatial

export var flow_direction = Vector3(1.0, 0.0, 0.0);
var heating_amount = 0.0;


var time_since_start = 0.0;

var cam_rotated = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var aerobubble = $Extras/AeroBubble
	var particles = $Particles
	
	var orbitcam = $CamOrigin/Spatial3
	var closeupcam = $CamLoc/Camera
	
	aerobubble.set_direction(flow_direction)
	aerobubble.set_heating_amount(heating_amount)
	particles.process_material.gravity = flow_direction * 500.0
	
	time_since_start += delta
	heating_amount = min(time_since_start * 0.1, 1.5)
	
	
	if time_since_start < 5.0:
		orbitcam.make_current()
		aerobubble.set_max_temp(1.0)
		
		orbitcam.rotation.y = -0.5 + time_since_start * 0.6
		
	elif time_since_start < 11.0:
		closeupcam.make_current()
		aerobubble.set_max_temp(heating_amount * 50.0)
		
	elif time_since_start < 16.0:
		orbitcam.make_current()
		aerobubble.set_max_temp(heating_amount * 5.0)
		
		if !cam_rotated:
			orbitcam.rotation.y = 2.2
			cam_rotated = true
		
		orbitcam.rotation.y += 4.0 * delta / time_since_start
		orbitcam.set_distance(13 + 5.0 * (time_since_start - 11))
		
	else:
		get_tree().reload_current_scene()
	
	
	
	
	
