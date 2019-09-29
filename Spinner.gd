extends Area2D

onready var sprite = get_node("Sprite")
var torque_damp = 0.90 # slow down spinner
var torque = 0 # apply force to spinner
var held = false
var clockwise = false
var temp_add_rot = 0 # angle offset when holding spinner
var mouse_speed = 0
var mouse_last_pos = Vector2()
var mouse_timer = 0
var stop_here = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process_input(true)
	sprite.set_meta("_edit_lock_", false)

# capturing mouse click on spinner
func _on_Spinner_input_event(viewport, event, shape_idx):
	if event.is_action("lmb"):
		held = event.is_action_pressed("lmb")
		torque = 0
		temp_add_rot = sprite.get_rotation() - sprite.get_position().angle_to_point(get_local_mouse_position())

func _input(event):
	if event.is_action_type() and not event.is_action_pressed("lmb"):
		held = false
		spin(mouse_speed / 5)
	elif event.is_action_type() and event.is_action_pressed("lmb"):
		held = true;

# sprite look at mouse
func point():
	var rot = sprite.get_rotation()
	sprite.set_rotation(sprite.get_position().angle_to_point(get_local_mouse_position()) + temp_add_rot)
	if rot > sprite.get_rotation():
		clockwise = true
	else:
		clockwise = false

func spin(amt):
	torque += amt

func _physics_process(delta):
	if abs(fmod(sprite.get_rotation(), 2*PI) - stop_here) < .1:
		sprite.set_meta("_edit_lock_", true)
		get_tree().get_root().get_node("Node").find_node("Locked").set_text("Locked!");
		print(sprite.get_rotation() - stop_here)
	if not sprite.get_meta("_edit_lock_"):
		mouse_timer += delta
		if mouse_timer > 0.2:
			mouse_speed = (mouse_speed + mouse_last_pos.distance_to(get_global_mouse_position())) / 2
			mouse_last_pos = get_global_mouse_position()
			mouse_timer = 0
		if held:
			point()
		else:
			if torque > 0.05:
				var new_rot = sprite.get_rotation()
				if clockwise:
					new_rot -= torque * delta
				else:
					new_rot += torque * delta
				torque *= torque_damp
				sprite.set_rotation(new_rot)
			else:
				torque = 0

func _on_Button_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node("Label").set_text("X");