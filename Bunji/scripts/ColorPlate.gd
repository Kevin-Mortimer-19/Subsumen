extends "Plate.gd";

enum {RED=1, BLUE=2}
export(int) var character_target; # 1 for c1, 2 for c2

# Called when the node enters the scene tree for the first time.
func _ready():
	._ready();

func _on_Plate_body_entered(body):
	if not body.get("character_number") == null:
		match character_target:
			RED:
				if body.is_red():
					is_pressed = false;
					call_deferred("run_enter");
			BLUE:
				if body.is_blue():
					is_pressed = false;
					call_deferred("run_enter");

func _on_Plate_body_exited(body):
	if not body.get("character_number") == null:
		match character_target:
			RED:
				if body.is_red():
					is_pressed = false;
					call_deferred("run_exit");
			BLUE:
				if body.is_blue():
					is_pressed = false;
					call_deferred("run_exit");
