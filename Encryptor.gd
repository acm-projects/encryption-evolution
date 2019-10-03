extends Panel

var ALPHA = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
             "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Button").connect("pressed", self, "_on_Button_pressed")

func _newLetter(oldLetter, shift):
	
	var i = ALPHA.find(oldLetter.to_upper())
	
	var n = i + shift
	if n > 25:
        n = n-26
	elif n < 0:
        n = n + 26
		
	return ALPHA[n]

func _encryptor(givenWord):
	print("Encryptor")
	var shift = randi()%26+1
	print(givenWord)
	print(shift)
	
	var newWord = ""

	for i in range(givenWord.length()):
		var c = givenWord[i] #_newLetter(oldLetter[i])
		newWord = newWord + _newLetter(c, shift)

	print(newWord)
	
# Attach this script to any button for the encryption to happen
func _on_Button_pressed():
	var givenWord = "Word"      # Change this to anything
	_encryptor(givenWord)
