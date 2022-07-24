extends Node


func _ready():
	get_node("Main_Menu/MarginContainer/VB/TextureButton").connect("pressed", self, "on_new_game_pressed")
	
func on_new_game_pressed():
	get_node("Main_Menu").queue_free()
	var game_scene = load("res://Main_Scenes/GameScene.tscn").instance()
	add_child(game_scene)
