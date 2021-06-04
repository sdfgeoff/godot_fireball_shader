extends Spatial


export var flow_direction = Vector3(1.0, 0.0, 0.0);
var heating_amount = 0.0;


var time_since_start = 0.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Extras/AeroBubble.set_direction(flow_direction)
	$Extras/AeroBubble.set_heating_amount(heating_amount)
	$Particles.process_material.gravity = flow_direction * 500.0
	
	time_since_start += delta
	heating_amount = min(time_since_start * 0.1, 1.5)
	
	
	if time_since_start < 5.0:
		$CamOrigin/Spatial3/CamLoc/OrbitCamera.make_current()
		$Extras/AeroBubble.set_max_temp(1.0)
	elif time_since_start < 11.0:
		$CamLoc/Camera.make_current()
		$Extras/AeroBubble.set_max_temp(heating_amount * 50.0)
	elif time_since_start < 17.0:
		$CamOrigin/Spatial3/CamLoc/OrbitCamera.make_current()
		$Extras/AeroBubble.set_max_temp(3.0)
	else:
		get_tree().reload_current_scene()
	
	
	
	
	
