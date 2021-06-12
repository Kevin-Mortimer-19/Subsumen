extends KinematicBody2D


export var character_number = 1; # 1 for c1, 2 for c2
export var move_speed = 200;

var vel = Vector2();


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	vel = Vector2();
	if character_number == 1: 
		if Input.is_action_pressed("move_c1_down"):
			vel.y += 1;
		if Input.is_action_pressed("move_c1_up"):
			vel.y -= 1;
		if Input.is_action_pressed("move_c1_left"):
			vel.x -= 1;
		if Input.is_action_pressed("move_c1_right"):
			vel.x += 1;
	else:
		if Input.is_action_pressed("move_c2_down"):
			vel.y += 1;
		if Input.is_action_pressed("move_c2_up"):
			vel.y -= 1;
		if Input.is_action_pressed("move_c2_left"):
			vel.x -= 1;
		if Input.is_action_pressed("move_c2_right"):
			vel.x += 1;
	move_and_slide( (vel.normalized()*move_speed), Vector2.UP);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
