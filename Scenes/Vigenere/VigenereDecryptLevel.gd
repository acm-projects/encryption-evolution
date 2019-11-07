extends Node

var index = 0 # current index within current label
var totalIndex = 0 # total number of buttons pressed so far
var currLabel = "Keyword" # the current label that is being changed
var toNum = true # used to determine if text field should be populated with numbers or letters
var messageLength = 6 # the length of the message being used

var key = "TURING"
var origMessage = "ENIGMA"
var encMessage = "" # origMessage encrypted in _ready()

var canContinue = false # when true, allows user to move on to decrypting the true message (NumToLetters)

# Called when the node enters the scene tree for the first time.
func _ready():
	encMessage = $ConvertToNum/Message._encryptor(origMessage, key)
	_on_ClearButton_pressed()     # Sets all variables to default values
	pass

# sets values back to appropriate defaults depending on whether the user is in the ConvertToNum stage or NumToLetters
func _on_ClearButton_pressed():
	if canContinue:
		$NumToLetters/EncryptedMessage.set_text("      ")
		$ScreenPrompt.set_text("")
		index = 0
		totalIndex = 0
		pass
	else:
		$ConvertToNum/Keyword.set_text(key)
		$ConvertToNum/Message.set_text(encMessage)
		$ConvertToNum/NumResult.set_text("")
		$NumToLetters/EncryptedMessage.set_text("      ")

		currLabel = "Keyword"
		index = 0
		totalIndex = 0
		toNum = true

# checks whether user has properly converted resulting sum of EncryptedMessage back into letters
# shows validation/invalidation messages
func checkDecrypted():
	if !(currLabel == "EncryptedMessage"):
		pass
	
	var labelText = $NumToLetters/EncryptedMessage.get_text()
	var userMessage = ""
	
	for i in range(labelText.length()):
		if labelText[i] != str(" "):
			userMessage += labelText[i]
	
	if (userMessage.length() == origMessage.length()):
		if (userMessage == origMessage):
			$ScreenPrompt.set_text("Beau Travail!")
			$Translation.set_text("[Great job!]")
		else:
			$ScreenPrompt.set_text("So close! Try again!")
	
# checks whether the user inputs for keyword and message are correctly converted
# if so, allows user to move on to deciphering the resulting sum (canContinue = true)
func checkAddition():
		
	var keyNumString = $ConvertToNum/Message.getNumString(key)
	var messNumString = $ConvertToNum/Message.getNumString(encMessage)
		
	var keyText = $ConvertToNum/Keyword.text
	var messText = $ConvertToNum/Message.text
	
	var keyNums = ""
	var messNums = ""
	
	for i in range(keyText.length()):
		if keyText[i] != str(" "):
			keyNums += keyText[i]
	
	for i in range(messText.length()):
		if messText[i] != str(" "):
			messNums += messText[i]
		
	if (messNums != messNumString) || (keyNums != keyNumString):
		pass
	else:
		canContinue = true

# checks whether user inputs are correct, and if so allows them to move on
# also displays some validation/invalidation messages
func _process(delta):

	if(currLabel == "Message"):
		checkAddition()
		if (index == 18) && !(canContinue):
			$ConvertToNum/NumResult.set_text("Not quite! Try again.")
			pass
		elif (canContinue):
			$ConvertToNum/NumResult.set_text("4  13 8  6  12 0")
			pass
	elif(currLabel == "EncryptedMessage"):
		checkDecrypted()
		pass

# this function checks to see if we need to move on to the next label or if we are still within the current label
# it also resets the index if we switch to a new label and switches toNum if necessary
func update_index():
	# if keyword has been converted to numbers, start converting message
	if (!canContinue) && (totalIndex >= messageLength) && (totalIndex < 2 * messageLength) && !(currLabel == "Message"):
		currLabel = "Message"
		index = 0
	# if keyword and message have been converted correctly, start deciphering resulting sum
	elif (canContinue) && !(currLabel == "EncryptedMessage"):
		currLabel = "EncryptedMessage"
		index = 0
		toNum = false
		
# prints index and totalIndex values
func debug():
	print("Index: " + str(index))
	print("TotalIndex: " + str(totalIndex))



# the functions below go with each letter button the the scroll bar on the left
# when pressed, updates the current text field with the appropriate letter/number
func _on_AButton_pressed():
	update_index()
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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


func _on_LButton_button_up():
	update_index()
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
	var label = get_tree().get_root().get_node("VigenereAsset").find_node(currLabel)
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
