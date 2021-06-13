extends "Interactible.gd";

export(bool) var active = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	if active:
		$CollisionShape2D.disabled = false;
		$Sprite.visible = true;
		active = true;

func _enter_effect():
	if(active):
		$CollisionShape2D.disabled = true;
		$Sprite.visible = false;
		active = false;

func _leave_effect():
	if not active:
		$CollisionShape2D.disabled = false;
		$Sprite.visible = true;
		active = true;
