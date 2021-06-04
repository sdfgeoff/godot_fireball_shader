extends Spatial



var rotated = false

var time_since_start = 0.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.rotate_y(-0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_since_start += delta
	
	if time_since_start < 11.0:
		self.rotate_y(0.6 * delta)
	
	if time_since_start > 5.0 and !rotated:
		rotated = true
		self.rotate_y(2.0)

	
	if time_since_start > 11.0:
		$CamLoc.translation.z += 5.0 * delta
		self.rotate_y(4.0 * delta / time_since_start)
