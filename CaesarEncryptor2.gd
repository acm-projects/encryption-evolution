extends Control

var ALPHA = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
             "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
			
var rng = RandomNumberGenerator.new()

const DECRYPTED_MESSAGE = "PREPAREFORYOURCHALLENGE"
var ENCRYPTED_MESSAGE = ""
var KEY = 0

func _init():
	rng.randomize()
	var tempKey = rng.randi_range(1, 26)
	ENCRYPTED_MESSAGE = _encryptor(DECRYPTED_MESSAGE, tempKey)
	KEY = 26 - tempKey
	print(KEY)                           # Currently the only way to tell what the key is until a label can be put onscreen
	print("Encrypted: "+ENCRYPTED_MESSAGE) # For if you don't actually feel like decoding it (developer mode!)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _getEncryptedMessage():
	return ENCRYPTED_MESSAGE


func _changeLetter(letter, shift, type):
	
	#Space
	if letter == " ":
		return " "
	
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
	

func _encryptor(givenWord, newShift):
	var shift = newShift
	
	var newWord = ""

	for i in range(givenWord.length()):
		var c = givenWord[i] #_newLetter(oldLetter[i])
		newWord = newWord + _changeLetter(c, shift, 1)

	_decryptor(newWord, shift)
	return newWord
	
func _decryptor(newWord, shift):
	var realWord = ""
	
	for i in range (newWord.length()):
		var c = newWord[i]
		realWord = realWord + _changeLetter(c, shift, 0)