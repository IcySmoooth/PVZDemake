extends Node2D
#extends "res://Scripts/Planting_Logic.gd"



var map_node

var build_mode = false
var build_valid = false
var build_location
var build_type

func _ready() -> void:
	map_node = get_node("/root/Front_Yard")
	
	for i in get_tree().get_nodes_in_group("plant_buttons"):
		i.connect("pressed", self, "initiate_build_mode", [i.get_name()])


func _process(_delta) -> void:
	pass


func _unhandled_input(event):
	pass


func initiate_build_mode(tower_type):
	build_type = tower_type
	build_mode = true
	#UI
	get_node("UI").set_tower_preview(build_type, get_global_mouse_position())


func update_tower_preview():
	pass


func cancel_build_mode():
	pass


func verify_and_build():
	pass
