extends Area2D


export(Array, NodePath) var node_path;

var linked_node = [];
var is_pressed = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in node_path:
		linked_node.append(get_node(n));

func _on_Plate_body_entered(body):
	is_pressed = true;
	call_deferred("run_enter");

func _on_Plate_body_exited(body):
	is_pressed = false;
	call_deferred("run_exit");

func run_enter():
	for l in linked_node:
		l._enter_effect();

func run_exit():
	for l in linked_node:
		l._leave_effect();
