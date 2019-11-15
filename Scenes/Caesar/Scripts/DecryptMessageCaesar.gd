extends Node

var ALPHA = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
             "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var user_input = ""
var label_dict
var message_no_spaces = "LIBRARYWENEEDYOU"
var message = "LIBRARY. WE NEED YOU."
var encrypted_message = ""
var key = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	key = get_tree().get_root().get_node("CaesarCipher").find_node("OuterWheel").get_meta("_key_")
	label_dict = {0: "Blank1", 1: "Blank2", 2: "Blank3", 3: "Blank4", 4: "Blank5", 5: "Blank6", 6: "Blank7", 7: "Blank8", 8: "Blank9", 9: "Blank10", 10: "Blank11", 11: "Blank12", 12: "Blank13", 13: "Blank14", 14: "Blank15", 15: "Blank16"}
	get_tree().get_root().get_node("CaesarCipher").find_node("MessageToDecrypt").set_text(_encryptor(message));
	
	$"CheckDecryption".visible = false

func _process(delta):
	_encryptor(message)
	user_input = ""
	for i in range(label_dict.size()):
		user_input = user_input + get_tree().get_root().get_node("CaesarCipher").find_node(label_dict.get(i)).get_text()
	
	if user_input == message_no_spaces:
		$CheckDecryption.visible = true

func _changeLetter(letter, shift, type):
	
	#Space
	if letter == " ":
		return " "
	
	# Period
	if letter == ".":
		return "."
	
	#Find the letter in the array 
	var i = ALPHA.find(letter.to_upper())
	var n
	
	#Encrypt letter with shift
	if type == 1:
		n = i + shift
		if n > 25:
    		n = n-26
	
	#Decrypt letter with shift
	elif type == 0:
		n = i - shift
		if n < 0:
			n = n + 26

	return ALPHA[n]

func _encryptor(givenWord):
	var newWord = ""

	for i in range(givenWord.length()):
		var c = givenWord[i] #_newLetter(oldLetter[i])
		newWord = newWord + _changeLetter(c, key, 1)

	return newWord

func _decryptor(newWord, shift):
	var realWord = ""
	
	for i in range (newWord.length()):
		var c = newWord[i]
		realWord = realWord + _changeLetter(c, shift, 0)

func _on_CheckDecryption_pressed():
	get_tree().change_scene("res://Scenes/Caesar/CaesarCipherEnd.tscn")