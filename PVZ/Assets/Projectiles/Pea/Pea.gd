extends KinematicBody2D

#const UP = Vector2(0, -1)
var motion = Vector2(0, -1)
#var movement = Vector2(0,0)
var speed = 10000

func _ready() -> void:
	motion.x = speed
	
func _physics_process(_delta):
	#motion.x = speed
	position.x += speed
	#motion = move_and_slide(motion)


func _on_offscreen_checker_screen_exited() -> void:
	queue_free()
