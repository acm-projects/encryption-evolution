extends Area2D

onready var wheel = get_node("OuterWheel") # variable containing the outer wheel sprite that can rotate
var input_angle = 0 # the angle that the user inputs based on the key that they input
var num_letters_pressed = 0 # how many letters have been entered, AKA how many buttons have been pressed
var label_dict # dictionary from number of letters pressed to label to be populated

var encryptor = null # encryptor object to call for the decrypted message variable

# Called when the node enters the scene tree for the first time.
func _ready():
	encryptor = load("res://CaesarEncryptor.gd").new()
	set_physics_process(true)
	set_process_input(true) 
	wheel.set_meta("_edit_lock_", true)
	label_dict = {0: "Blank1", 1: "Blank2", 2: "Blank3", 3: "Blank4", 4: "Blank5", 5: "Blank6",
	 6: "Blank7", 7: "Blank8", 8: "Blank9", 9: "Blank10"}

# capturing mouse click on spinner

func _on_Spinner_input_event(viewport, event, shape_idx):
	if event.is_action("lmb"):
		wheel.set_meta("_edit_lock_", true)

# sets the rotation of the spinner to the required offset entered by the user
func _on_GoButton_pressed():
	input_angle = get_tree().get_root().get_node("CaesarCipher").find_node("ShiftAmountField").get_value()
	input_angle = ((2*PI) / 26) * input_angle
	wheel.set_rotation(input_angle)

# deletes the last entered letter by decrementing num_letters_pressed and returning the corresponding text field to "_"
func _on_Backspace_pressed():

	if num_letters_pressed > 10: # TODO Use variable size instead of hard coding
		num_letters_pressed = 10
	num_letters_pressed = num_letters_pressed - 1
	get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank10")).set_text("_")

func _process(delta):
	_check_Encrypted()

# checks if entered message is correctly encrypted
# called when the last letter of the word (D) is entered (see line 151) (should optimize later)
func _check_Encrypted():
	var encryptedMessage = self.encryptor._getEncryptedMessage()
	
	var enteredMessage = ""
	
	for i in range(label_dict.size()):       # combines every "Blank"'s text into one string
		var theBlank = label_dict.get(i)
		var theLetter = get_tree().get_root().get_node("CaesarCipher").find_node(theBlank).text
		enteredMessage += theLetter
	
	if (enteredMessage == encryptedMessage):
		get_tree().get_root().get_node("CaesarCipher").find_node("NextArrow").visible = true # Shows green arrow


# all of these funtions allow the letter buttons to function. They change the appropriate
# text field to the button value and then increment the couter of the number of buttons pressed.
func _on_A_pressed():
	if wheel.get_meta("_edit_lock_") == true:

		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("A");
		num_letters_pressed = num_letters_pressed + 1

func _on_N_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("N");

		num_letters_pressed = num_letters_pressed + 1

func _on_R_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("R");

		num_letters_pressed = num_letters_pressed + 1


func _on_S_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("S");
		num_letters_pressed = num_letters_pressed + 1


func _on_T_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("T");

		num_letters_pressed = num_letters_pressed + 1


func _on_U_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("U");
		num_letters_pressed = num_letters_pressed + 1


func _on_W_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("W");
		num_letters_pressed = num_letters_pressed + 1


func _on_X_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("X");
		num_letters_pressed = num_letters_pressed + 1


func _on_Y_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("Y");
		num_letters_pressed = num_letters_pressed + 1


func _on_Z_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("Z");
		num_letters_pressed = num_letters_pressed + 1


func _on_O_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("O");
		num_letters_pressed = num_letters_pressed + 1


func _on_P_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("P");
		num_letters_pressed = num_letters_pressed + 1


func _on_Q_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("Q");
		num_letters_pressed = num_letters_pressed + 1


func _on_V_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("V");
		num_letters_pressed = num_letters_pressed + 1


func _on_B_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("B");
		num_letters_pressed = num_letters_pressed + 1


func _on_C_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("C");
		num_letters_pressed = num_letters_pressed + 1


func _on_D_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("D");
		num_letters_pressed = num_letters_pressed + 1


func _on_E_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("E");
		num_letters_pressed = num_letters_pressed + 1


func _on_F_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("F");
		num_letters_pressed = num_letters_pressed + 1
		_check_Encrypted() # Checks if entered message is correctly encrypted


func _on_G_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("G");
		num_letters_pressed = num_letters_pressed + 1


func _on_H_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("H");
		num_letters_pressed = num_letters_pressed + 1


func _on_I_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("I");
		num_letters_pressed = num_letters_pressed + 1


func _on_J_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("J");
		num_letters_pressed = num_letters_pressed + 1


func _on_K_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("K");
		num_letters_pressed = num_letters_pressed + 1


func _on_L_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("L");
		num_letters_pressed = num_letters_pressed + 1


func _on_M_pressed():
	if wheel.get_meta("_edit_lock_") == true:
		get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(num_letters_pressed, "Blank7")).set_text("M");
		num_letters_pressed = num_letters_pressed + 1