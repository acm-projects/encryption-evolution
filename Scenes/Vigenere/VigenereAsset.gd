extends Node

var index = 0 # current index within current label
var totalIndex = 0 # total number of buttons pressed so far
var currLabel = "Keyword" # the current label that is being changed
var toNum = true # used to determine if text field should be populated with numbers or letters
var messageLength = 7 # the length of the message being used

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# this function checks to see if we need to move on to the next label or if we are still within the current label
# it also resets the index if we switch to a new label and switches toNum if necessary
func update_index():
	if totalIndex == 13:
		get_tree().get_root().get_node("VigenereAsset").find_node("NumResult").set_text("22 8  42 40 14 17 7")
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