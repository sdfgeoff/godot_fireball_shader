extends Spatial


export var shake_amount = 0.3
export var shake_damping = 0.2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.transform.origin += Vector3(
		randf() - 0.5,
		randf() - 0.5,
		randf() - 0.5
	) * shake_amount
	self.transform.origin *= shake_damping
