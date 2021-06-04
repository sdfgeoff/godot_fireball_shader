extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	var shader: ShaderMaterial = material_override;
	shader.set_shader_param("time", time * 5.0)


func set_direction(direction: Vector3):
	var shader: ShaderMaterial = material_override;
	shader.set_shader_param("flow_direction", direction)


func set_heating_amount(amount: float):
	var shader: ShaderMaterial = material_override;
	shader.set_shader_param("heating_amount", amount)


func set_max_temp(temp: float):
	var shader: ShaderMaterial = material_override;
	shader.set_shader_param("max_temp", temp)
