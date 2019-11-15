extends Node

var dialogue = ["That's it! This is the Playfair cipher, which was used heavily in World War I and World War II. In order to use the Playfair cipher, we need a keyword. For this tutorial we will use \"keyword\" as our keyword.",
"\"Keyword\" does not have repeating letters, but if it did we would delete the repeated letters.",
"As shown on the left, we next write the keyword on a 5x5 grid followed by all other letters of the alphabet not already present in the keyword.", 
"We will next examine the message that we want to encrypt. For this example, we will ecrypt the word \"MESSAGE.\"",
"If the message has repeating letters, replace the second in the pair with an 'x'. If there is an odd number of letters, add an 'x' at the end.",
"Begin encryption by splitting up the message into groups of two letters.", 
"Start with the first pair. Find them on the grid on the left.", 
"Draw a box around the pair of letters.", 
"Take the letters in the opposing corners of the box to be the encrypted letters. The first encrypted letter will be the one in the same row as the first original letter.",
"If the letters happened to be in the same column, we would replace them with the letters immediately below the originals, wrapping around the box if necessary.",
"If the letters happened to be in the same row, we would replace them with the letters immediately to the right of the originals, wrapping around the box if necessary.",
"Repeat for the remaining letter pairs. Press continue to follow along with the rest of the encryption.",
"SX becomes QZ",
"AG becomes DH",
"EX becomes WU",
"Encrypting is now finished! Decrypting a message will follow a similar process in reverse. Press continue to try decrypting a message."]

var index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().get_node("PlayfairAsset").find_node("RichTextLabel").set_bbcode(dialogue[index])
	get_tree().get_root().get_node("PlayfairAsset").find_node("RichTextLabel").set_visible_characters(0)


func _on_ContinueButton_pressed():
	if get_tree().get_root().get_node("PlayfairAsset").find_node("RichTextLabel").get_visible_characters() > get_tree().get_root().get_node("PlayfairAsset").find_node("RichTextLabel").get_total_character_count():
			if index < dialogue.size()-1:
				index += 1
				get_tree().get_root().get_node("PlayfairAsset").find_node("RichTextLabel").set_bbcode(dialogue[index])
				get_tree().get_root().get_node("PlayfairAsset").find_node("RichTextLabel").set_visible_characters(0)
			else:
				get_tree().change_scene("res://Scenes/Playfair/PFDecryptTutorial.tscn")
	if index < dialogue.size():
		if index == 4:
			get_tree().get_root().get_node("PlayfairAsset").find_node("Message").set_text("Encrypt: MESXAGEX")
		if index == 5:
			get_tree().get_root().get_node("PlayfairAsset").find_node("Message").set_text("Encrypt: ME SX AG EX")
		if index == 7:
			get_tree().get_root().get_node("PlayfairAsset").find_node("LetterBoxOutline1").show()
		if index == 8:
			get_tree().get_root().get_node("PlayfairAsset").find_node("EncryptedMessage").set_text("NK")
		if index == 11:
			get_tree().get_root().get_node("PlayfairAsset").find_node("LetterBoxOutline1").hide()
		if index == 12:
			get_tree().get_root().get_node("PlayfairAsset").find_node("LetterBoxOutline2").show()
			get_tree().get_root().get_node("PlayfairAsset").find_node("EncryptedMessage").set_text("NKQZ")
		if index == 13:
			get_tree().get_root().get_node("PlayfairAsset").find_node("LetterBoxOutline2").hide()
			get_tree().get_root().get_node("PlayfairAsset").find_node("LetterBoxOutline3").show()
			get_tree().get_root().get_node("PlayfairAsset").find_node("EncryptedMessage").set_text("NKQZDH")
		if index == 14:
			get_tree().get_root().get_node("PlayfairAsset").find_node("LetterBoxOutline3").hide()
			get_tree().get_root().get_node("PlayfairAsset").find_node("LetterBoxOutline4").show()
			get_tree().get_root().get_node("PlayfairAsset").find_node("EncryptedMessage").set_text("NKQZDHWU")
		if index == 15:
			get_tree().get_root().get_node("PlayfairAsset").find_node("LetterBoxOutline4").hide()
		#get_tree().get_root().get_node("PlayfairAsset").find_node("TextBox").set_text(dialogue[index])
		#index = index + 1
	else:
		get_tree().change_scene("res://Scenes/Playfair/PFDecryptTutorial.tscn")


# Auto-scrolls text
func _on_Timer_timeout():
	get_tree().get_root().get_node("PlayfairAsset").find_node("RichTextLabel").set_visible_characters(get_tree().get_root().get_node("PlayfairAsset").find_node("RichTextLabel").get_visible_characters()+1)
