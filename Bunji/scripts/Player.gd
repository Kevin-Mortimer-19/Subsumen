extends KinematicBody2D

enum {BLUE=1, RED=2, PURPLE=3}
export var character_number = RED; # 1 for c1, 2 for c2
export var move_speed = 200;
export(Texture) var sprite;
export var tile_size = 64;

var vel = Vector2();

onready var ray = $RayCast2D
var input_set = [0,0,0,0]

const BULLET = preload("res://entities/Bullet.tscn");
var PURPLE_MAN = load("res://sprites/C3.png")

# cooldown between shots
var b_cooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = sprite;
	$Sprite.scale = Vector2(4, 4);

func _physics_process(delta):
	vel = Vector2(0,0);
	if is_red(): 
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
	if is_blue():
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
	if ray.is_colliding():
		if ray.get_collider().get_name().begins_with("PushBlock") && is_red():
			ray.get_collider().mov(vel)
		if ray.get_collider().get_name().begins_with("Player"):
			purple_man(ray.get_collider())
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

func is_red():
	return true if (character_number != 1) else false;

func is_blue():
	return true if (character_number != 2) else false;

func purple_man(not_purple_man):
	get_node("Sprite").texture = PURPLE_MAN
	global_position = not_purple_man.global_position
	character_number = PURPLE
	not_purple_man.queue_free()
	get_node("ShlorpMaster").play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
