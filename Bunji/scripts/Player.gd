extends KinematicBody2D


export var character_number = 1; # 1 for c1, 2 for c2
export var move_speed = 200;
export var tile_size = 64;

var vel = Vector2();

onready var ray = $RayCast2D
var input_set = [0,0,0,0]

const BULLET = preload("res://entities/Bullet.tscn");
# cooldown between shots
var b_cooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	vel = Vector2(0,0);
	if character_number == 1: 
		if Input.is_action_just_pressed("move_c1_down"):
			vel.y += 1;
			input_set = [0,1,0,0]
		if Input.is_action_just_pressed("move_c1_up"):
			vel.y -= 1;
			input_set = [1,0,0,0]
		if Input.is_action_just_pressed("move_c1_left"):
			vel.x -= 1;
			input_set = [0,0,1,0]
		if Input.is_action_just_pressed("move_c1_right"):
			vel.x += 1;
			input_set = [0,0,0,1]
		if Input.is_action_just_pressed("fire") && b_cooldown == 0:
			fire();
			b_cooldown = 10;
	else:
		if Input.is_action_just_pressed("move_c2_down"):
			vel.y += 1;
		if Input.is_action_just_pressed("move_c2_up"):
			vel.y -= 1;
		if Input.is_action_just_pressed("move_c2_left"):
			vel.x -= 1;
		if Input.is_action_just_pressed("move_c2_right"):
			vel.x += 1;
	mov(vel)
	#move_and_slide( (vel.normalized()*move_speed), Vector2.UP);
	if b_cooldown > 0:
		b_cooldown -= 1;

func mov(vel):
	ray.cast_to = vel*tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		global_position.x += tile_size*vel.x
		global_position.y += tile_size*vel.y

func fire():
	var b = BULLET.instance()
	get_parent().add_child(b)
	var offset = Vector2(32,32)
	b.global_position = global_position + offset
	var v = Vector2(0,0)
	if input_set[0] == 1:
		v.y-=1
	elif input_set[1] == 1:
		v.y+=1
	elif input_set[2] == 1:
		v.x-=1
	elif input_set[3] == 1:
		v.x+=1
	b.init(v)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
