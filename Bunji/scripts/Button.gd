extends "Plate.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _on_Button_body_entered(body):
	if is_pressed == true:
		call_deferred("run_exit");
		is_pressed = false
	else:
		call_deferred("run_enter");
		is_pressed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
