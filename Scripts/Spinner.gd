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
var stop_here = 2.5
var num_letters_pressed = 0 # how many letters have been entered, AKA how many buttons have been pressed
var label_dict

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process_input(true)
	sprite.set_meta("_edit_lock_", false)
	label_dict = {0: "Letter1", 1: "Letter2", 2: "Letter3", 3: "Letter4", 4: "Letter5", 5: "Letter6", 6: "Letter7"}

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

func _on_A_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("A");
		num_letters_pressed = num_letters_pressed + 1

func _on_N_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("N");
		num_letters_pressed = num_letters_pressed + 1

func _on_R_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("R");
		num_letters_pressed = num_letters_pressed + 1


func _on_S_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("S");
		num_letters_pressed = num_letters_pressed + 1


func _on_T_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("T");
		num_letters_pressed = num_letters_pressed + 1


func _on_U_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("U");
		num_letters_pressed = num_letters_pressed + 1


func _on_W_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("W");
		num_letters_pressed = num_letters_pressed + 1


func _on_X_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("X");
		num_letters_pressed = num_letters_pressed + 1


func _on_Y_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("Y");
		num_letters_pressed = num_letters_pressed + 1


func _on_Z_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("Z");
		num_letters_pressed = num_letters_pressed + 1


func _on_O_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("O");
		num_letters_pressed = num_letters_pressed + 1


func _on_P_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("P");
		num_letters_pressed = num_letters_pressed + 1


func _on_Q_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("Q");
		num_letters_pressed = num_letters_pressed + 1


func _on_V_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("V");
		num_letters_pressed = num_letters_pressed + 1


func _on_B_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("B");
		num_letters_pressed = num_letters_pressed + 1


func _on_C_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("C");
		num_letters_pressed = num_letters_pressed + 1


func _on_D_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("D");
		num_letters_pressed = num_letters_pressed + 1


func _on_E_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("E");
		num_letters_pressed = num_letters_pressed + 1


func _on_F_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("F");
		num_letters_pressed = num_letters_pressed + 1


func _on_G_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("G");
		num_letters_pressed = num_letters_pressed + 1


func _on_H_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("H");
		num_letters_pressed = num_letters_pressed + 1


func _on_I_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("I");
		num_letters_pressed = num_letters_pressed + 1


func _on_J_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("J");
		num_letters_pressed = num_letters_pressed + 1


func _on_K_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("K");
		num_letters_pressed = num_letters_pressed + 1


func _on_L_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("L");
		num_letters_pressed = num_letters_pressed + 1


func _on_M_pressed():
	if sprite.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("Node").find_node(label_dict.get(num_letters_pressed, "Letter5")).set_text("M");
		num_letters_pressed = num_letters_pressed + 1
