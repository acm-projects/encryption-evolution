extends Node

var keyword = "KEYWORD"
var message = "MESSAGE"
var keywordNumeric = "10 4  24 22 14 17 3  "
var messageNumeric = "12 4  18 18 0  6  4  "
var index = 0 # current index within current label
var totalIndex = 0 # total number of buttons pressed so far
var currLabel = "Keyword" # the current label that is being changed
var toNum = true # used to determine if text field should be populated with numbers or letters
var messageLength = 7 # the length of the message being used
var dialogue = ["Lets learn the basics of the Vigenere cipher. Press continue to begin.",
"For this cipher, we will need a keyword. In this tutorial the keyword is \"keyword.\"",
"We will encrypt the word \"message\" with the Vigenere cipher. Begin by stacking the two words on top of each other, repeating the keyword as necessary to cover the message.",
"Next we need to convert each letter in the keyword and message into a numerical value. On the left, you can see buttons the contain the conversion from letter to number.",
"Going from left to right, press the buttons corresponding to each letter in the keyword and the message. You may continue when your answers are correct.",
"Next, the keyword and message are added together by adding their corresponding numerican values. This step is done for you.",
"Now we need to make sure each new number still falls in the range 0-25.",
"Going from right to left, check each number. If it is greater than 25, subtract 26. Press each correct new number. You may continue when your answers are correct.",
"Encryption is now complete! We can decrypt this message in a similar way. Press continue to move on to decryption."]
var dialogueIndex = 1
var additionComplete = false
var modComplete = false
var finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$ContinueButton.visible = false
	pass

# this checks that the user entered the current step correctly and then resets that step if it is incorrect
func _process(delta):
	if totalIndex == 7:
		if get_tree().get_root().get_node("VigenereHowTo").find_node("Keyword").get_text() != keywordNumeric:
			totalIndex = totalIndex - 1
			_on_ResetCurrentStep_pressed()
	if totalIndex == 14:
		if get_tree().get_root().get_node("VigenereHowTo").find_node("Message").get_text() != messageNumeric:
			totalIndex = totalIndex - 1
			_on_ResetCurrentStep_pressed()
		else:
			get_tree().get_root().get_node("VigenereHowTo").find_node("NumResult").set_text("22 8  42 40 14 23 7")
			additionComplete = true
	if totalIndex == 21:
		if get_tree().get_root().get_node("VigenereHowTo").find_node("EncryptedNum").get_text() != "22 8  16 14 14 23 7  ":
			totalIndex = totalIndex - 1
			_on_ResetCurrentStep_pressed()
		else:
			modComplete = true
	if totalIndex == 28:
		if get_tree().get_root().get_node("VigenereHowTo").find_node("EncryptedMessage").get_text() != "W  I  Q  O  O  X  H  ":
			totalIndex = totalIndex - 1
			_on_ResetCurrentStep_pressed()
		else:
			print(totalIndex)
			print("Finished")
			$ContinueButton.visible = true
			finished = true
			get_tree().get_root().get_node("VigenereHowTo").find_node("TextBox").set_text(dialogue[dialogue.size() - 1])
			


# update the dialogue box
func _on_Continue_pressed():
	if finished:
		get_tree().change_scene("res://Scenes/Vigenere/VigenereHowToDecrypt.tscn")
	if dialogueIndex < dialogue.size():
		if dialogueIndex == 5:
			if additionComplete:
				get_tree().get_root().get_node("VigenereHowTo").find_node("TextBox").set_text(dialogue[dialogueIndex])
				dialogueIndex = dialogueIndex + 1
		elif dialogueIndex == 8:
			if modComplete:
				get_tree().get_root().get_node("VigenereHowTo").find_node("TextBox").set_text(dialogue[dialogueIndex])
				dialogueIndex = dialogueIndex + 1
		else:
			get_tree().get_root().get_node("VigenereHowTo").find_node("TextBox").set_text(dialogue[dialogueIndex])
			dialogueIndex = dialogueIndex + 1


func _on_ResetCurrentStep_pressed():
	if totalIndex < messageLength:
		get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel).set_text(keyword)
		index = 0
		totalIndex = 0
	elif totalIndex >= messageLength && totalIndex < 2 * messageLength:
		get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel).set_text(message)
		totalIndex = messageLength
		index = 0
	elif totalIndex >= 2 * messageLength && totalIndex < 3 * messageLength:
		get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel).set_text("       ")
		totalIndex = 2 * messageLength
		index = 0
	elif totalIndex >= 3 * messageLength:
		get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel).set_text("       ")
		totalIndex = 3 * messageLength
		index = 0


# this function checks to see if we need to move on to the next label or if we are still within the current label
# it also resets the index if we switch to a new label and switches toNum if necessary
func update_index():
	if totalIndex >= messageLength && totalIndex < 2 * messageLength && !(currLabel == "Message"):
		currLabel = "Message"
		index = 0
	elif totalIndex >= 2 * messageLength && totalIndex < 3 * messageLength && !(currLabel == "EncryptedNum"):
		currLabel = "EncryptedNum"
		index = 0
	elif totalIndex >= 3 * messageLength && totalIndex < 4 * messageLength && !(currLabel == "EncryptedMessage"):
		currLabel = "EncryptedMessage"
		index = 0
		toNum = false

# the functions below go with each letter button the the scroll bar on the left
# when pressed, updates the current text field with the appropriate letter/number
func _on_AButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '0  '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'A  '
		index = index + 2
	
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1

func _on_BButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '1  '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'B  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1

func _on_CButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '2  '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'C  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1

func _on_DButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '3  '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'D  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_EButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '4  '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'E  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_FButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '5  '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'F  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_GButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '6  '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'G  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_HButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '7  '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'H  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_IButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '8  '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'I  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_JButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '9  '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'J  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_KButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '10 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'K  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_LButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '11 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'L  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_MButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '12 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'M  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_NButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '13 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'N  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_OButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '14 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'O  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_PButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '15 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'P  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_QButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '16 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'Q  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_RButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '17 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'R  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_SButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '18 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'S  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_TButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '19 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'T  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_UButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '20 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'U  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_VButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '21 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'V  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_WButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '22 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'W  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_XButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '23 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'X  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_YButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '24 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'Y  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1


func _on_ZButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereHowTo").find_node(currLabel)
	var currText = label.get_text()
	if toNum and index < currText.length():
		currText[index] = '25 '
		index = index + 2
	elif index < currText.length():
		currText[index] = 'Z  '
		index = index + 2
	label.set_text(currText)
	index = index + 1
	totalIndex = totalIndex + 1

func _on_ContinueButton_pressed():
	print("Hi")
	get_tree().change_scene("res://Scenes/Vigenere/VigenereHowToDecrypt.tscn")
