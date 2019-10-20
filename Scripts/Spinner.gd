extends Area2D

onready var wheel = get_node("OuterWheel")
var torque_damp = 0.90 # slow down spinner
var torque = 0 # apply force to spinner
var held = false
var clockwise = false
var temp_add_rot = 0 # angle offset when holding spinner
var mouse_speed = 0
var mouse_last_pos = Vector2()
var mouse_timer = 0
var key = 0
var stop_angle = 0
var num_letters_pressed = 0 # how many letters have been entered, AKA how many buttons have been pressed
var label_dict
var locked_message = "Locked!"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	key = randi()%27 + 1
	locked_message = locked_message + "\nKey = " + str(key)
	set_physics_process(true)
	set_process_input(true)
	wheel.set_meta("_edit_lock_", false)
	wheel.set_meta("_key_", key)
	print(key)
	label_dict = {0: "Blank1", 1: "Blank2", 2: "Blank3", 3: "Blank4", 4: "Blank5", 5: "Blank6", 6: "Blank7", 7: "Blank8", 8: "Blank9", 9: "Blank10", 10: "Blank11", 11: "Blank12", 12: "Blank13", 13: "Blank14", 14: "Blank15", 15: "Blank16"}
	stop_angle = ((2*PI) / 26) * key
	

# capturing mouse click on spinner
func _on_Spinner_input_event(viewport, event, shape_idx):
	if event.is_action("lmb"):
		held = event.is_action_pressed("lmb")
		torque = 0
		temp_add_rot = wheel.get_rotation() - wheel.get_position().angle_to_point(get_local_mouse_position())

func _input(event):
	if event.is_action_type() and not event.is_action_pressed("lmb"):
		held = false
		spin(mouse_speed / 5)
	elif event.is_action_type() and event.is_action_pressed("lmb"):
		held = true;

# sprite look at mouse
func point():
	var rot = wheel.get_rotation()
	wheel.set_rotation(wheel.get_position().angle_to_point(get_local_mouse_position()) + temp_add_rot)
	if rot > wheel.get_rotation():
		clockwise = true
	else:
		clockwise = false

func spin(amt):
	torque += amt

func _physics_process(delta):
	if abs(fmod(wheel.get_rotation(), 2*PI) - stop_angle) < .01:
		wheel.set_meta("_edit_lock_", true)
		get_tree().get_root().get_node("CaesarCipher").find_node("Locked").set_text(locked_message);
	if not wheel.get_meta("_edit_lock_"):
		mouse_timer += delta
		if mouse_timer > 0.2:
			mouse_speed = (mouse_speed + mouse_last_pos.distance_to(get_global_mouse_position())) / 2
			mouse_last_pos = get_global_mouse_position()
			mouse_timer = 0
		if held:
			point()
		else:
			if torque > 0.05:
				var new_rot = wheel.get_rotation()
				if clockwise:
					new_rot -= torque * delta
				else:
					new_rot += torque * delta
				torque *= torque_damp
				wheel.set_rotation(new_rot)
			else:
				torque = 0

func _on_Backspace_pressed():
	if num_letters_pressed > 0:
		num_letters_pressed = num_letters_pressed - 1
	get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed)).set_text("_")

func _on_A_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("A");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1

func _on_N_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("N");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1

func _on_R_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("R");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_S_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("S");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_T_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("T");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_U_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("U");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_W_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("W");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_X_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("X");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_Y_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("Y");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_Z_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("Z");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_O_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("O");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_P_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("P");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_Q_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("Q");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_V_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("V");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_B_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("B");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_C_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("C");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_D_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("D");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_E_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("E");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_F_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("F");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_G_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("G");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_H_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("H");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_I_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("I");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_J_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("J");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_K_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("K");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_L_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("L");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1


func _on_M_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		torque = 0
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("M");
		if num_letters_pressed < label_dict.size():
			num_letters_pressed = num_letters_pressed + 1