extends KinematicBody2D

enum {RED=1, BLUE=2}
export var character_number = RED; # 1 for c1, 2 for c2
export var move_speed = 200;
export(Texture) var sprite;

var vel = Vector2();

const BULLET = preload("res://entities/Bullet.tscn");
# cooldown between shots
var b_cooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = sprite;
	$Sprite.scale = Vector2(4, 4);

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
		if Input.is_action_pressed("fire") && b_cooldown == 0:
			fire(vel);
			b_cooldown = 10;
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
	if b_cooldown > 0:
		b_cooldown -= 1;

func fire(v):
	var b = BULLET.instance()
	get_parent().add_child(b)
	b.global_position = global_position
	b.init(v)

func is_red():
	return RED if (character_number == 1) else BLUE;

func is_blue():
	return true if (character_number == 2) else false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
