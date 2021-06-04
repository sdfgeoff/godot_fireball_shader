extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var thruster_material: Material;
export var fire_probability: float = 0.02;

# Called when the node enters the scene tree for the first time.
func _ready():
	var child: MeshInstance = get_children()[0]
	child.mesh.surface_set_material(0, thruster_material)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for child in get_children():
		child.visible = randf() < fire_probability
