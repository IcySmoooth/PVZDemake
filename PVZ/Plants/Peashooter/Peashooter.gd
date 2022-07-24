extends Node2D


# Allows me to quickly reference the Pea projectile when it's time to spawn it in
onready var PEASHOOTER_PEA = preload("res://Assets/Projectiles/Pea/Pea.tscn")

var enemy_array = []
func _start():
	# Eventually change this so that it doesnt start shooting right away and only shoot when detecting enemies
	
	$Shoot_Timer.start()

func _process(_delta):
	pass
	#print($Shoot_Timer.time_left)

"""

The purpose of these functions is that The Peashooter fires in intervals of 1.5 seconds, but timing the peashooter to play the shoot animation before the bullet spawns as well as spawn the bullet 
before the shoot animation is over is tricky.

The first function is called when the timer Shoot_Timer, which is 1 second, is done. First the animation is played, then a secondary timer, InbetweenTimer is started. The purpose of this second 
timer is to go off 0.2 seconds into the animation, which is when the pea should be spawned in. This is handled in the third function.

The second function is called when the shoot animation is finished. By this point, 1.5 seconds of in-game time will have passed, meaning that we can start the timer, and this whole process, over
again.

"""

func _on_Shoot_Timer_timeout() -> void:
	$KinematicBody2D/Peashooter_Head/Peashooter_Head_Anim.play("Shoot")
	$Shoot_Timer/InbetweenTimer.start()


func _on_Peashooter_Head_Anim_animation_finished(anim_name: String) -> void:
	if anim_name == "Shoot":
		$Shoot_Timer.start()


func _on_InbetweenTimer_timeout() -> void:
	var bullet =  PEASHOOTER_PEA.instance()
	#print("Position2D: ",$KinematicBody2D/Peashooter_Head/Position2D.position)
	bullet.position = $KinematicBody2D/Peashooter_Head/Position2D.position
	#print(bullet.position)
	#get_node("/root/Peashooter").add_child(bullet)
	#get_node("/root/Peashooter/KinematicBody2D/Peashooter_Head/Position2D").add_child(bullet)
