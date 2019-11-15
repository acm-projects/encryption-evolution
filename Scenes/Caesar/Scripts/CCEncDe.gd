extends Node

var ALPHA = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
             "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass

func _changeLetter(letter, shift, type):
	if letter == " ": #Space
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
	

func _encryptor(givenWord, shift):	

	var newWord = ""

	for i in range(givenWord.length()):
		var c = givenWord[i] #_newLetter(oldLetter[i])
		newWord = newWord + _changeLetter(c, shift, 1)

	return newWord
	
func _decryptor(newWord, shift):
	
	var realWord = ""
	
	for i in range (newWord.length()):
		var c = newWord[i]
		realWord = realWord + _changeLetter(c, shift, 0)
		
	return realWord
	
 