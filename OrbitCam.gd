""" A trivial single-use-only camera rig """
extends Spatial


func set_distance(distance):
	$CamLoc.translation.z = distance

func make_current():
	$CamLoc/OrbitCamera.make_current()
