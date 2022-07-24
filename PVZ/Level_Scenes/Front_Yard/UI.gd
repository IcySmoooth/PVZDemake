extends CanvasLayer


func set_tower_preview(tower_type, mouse_position):
	var drag_tower = load("res://Plants/" + tower_type + "/" + tower_type + ".tscn").instance()
	#res://Plants/Peashooter/Peashooter.tscn
	drag_tower = set_name("DragTower")
	
	var control = Control.new()
	control.add_child(drag_tower, true)
	control.rect_position = mouse_position
	control.set_name("TowerPreview")
	add_child(control, true)
