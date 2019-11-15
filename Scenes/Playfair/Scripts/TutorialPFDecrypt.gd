extends Node2D

var encText = ""
var decText = ""
var isFinishedScene = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	encText = $TextOrganizer/EncryptedMessage._encryptMessage("KEYWORD", "SECRETWORD")
	
	$PlayfairGrid/Col1/R0C0.set_text( $TextOrganizer/EncryptedMessage.ALPHA[0][0] )
	$PlayfairGrid/Col1/R1C0.set_text( $TextOrganizer/EncryptedMessage.ALPHA[1][0] )
	$PlayfairGrid/Col1/R2C0.set_text( $TextOrganizer/EncryptedMessage.ALPHA[2][0] )
	$PlayfairGrid/Col1/R3C0.set_text( $TextOrganizer/EncryptedMessage.ALPHA[3][0] )
	$PlayfairGrid/Col1/R4C0.set_text( $TextOrganizer/EncryptedMessage.ALPHA[4][0] )
	
	$PlayfairGrid/Col2/R0C1.set_text( $TextOrganizer/EncryptedMessage.ALPHA[0][1] )
	$PlayfairGrid/Col2/R1C1.set_text( $TextOrganizer/EncryptedMessage.ALPHA[1][1] )
	$PlayfairGrid/Col2/R2C1.set_text( $TextOrganizer/EncryptedMessage.ALPHA[2][1] )
	$PlayfairGrid/Col2/R3C1.set_text( $TextOrganizer/EncryptedMessage.ALPHA[3][1] )
	$PlayfairGrid/Col2/R4C1.set_text( $TextOrganizer/EncryptedMessage.ALPHA[4][1] )
	
	$PlayfairGrid/Col3/R0C2.set_text( $TextOrganizer/EncryptedMessage.ALPHA[0][2] )
	$PlayfairGrid/Col3/R1C2.set_text( $TextOrganizer/EncryptedMessage.ALPHA[1][2] )
	$PlayfairGrid/Col3/R2C2.set_text( $TextOrganizer/EncryptedMessage.ALPHA[2][2] )
	$PlayfairGrid/Col3/R3C2.set_text( $TextOrganizer/EncryptedMessage.ALPHA[3][2] )
	$PlayfairGrid/Col3/R4C2.set_text( $TextOrganizer/EncryptedMessage.ALPHA[4][2] )
	
	$PlayfairGrid/Col4/R0C3.set_text( $TextOrganizer/EncryptedMessage.ALPHA[0][3] )
	$PlayfairGrid/Col4/R1C3.set_text( $TextOrganizer/EncryptedMessage.ALPHA[1][3] )
	$PlayfairGrid/Col4/R2C3.set_text( $TextOrganizer/EncryptedMessage.ALPHA[2][3] )
	$PlayfairGrid/Col4/R3C3.set_text( $TextOrganizer/EncryptedMessage.ALPHA[3][3] )
	$PlayfairGrid/Col4/R4C3.set_text( $TextOrganizer/EncryptedMessage.ALPHA[4][3] )
	
	$PlayfairGrid/Col5/R0C4.set_text( $TextOrganizer/EncryptedMessage.ALPHA[0][4] )
	$PlayfairGrid/Col5/R1C4.set_text( $TextOrganizer/EncryptedMessage.ALPHA[1][4] )
	$PlayfairGrid/Col5/R2C4.set_text( $TextOrganizer/EncryptedMessage.ALPHA[2][4] )
	$PlayfairGrid/Col5/R3C4.set_text( $TextOrganizer/EncryptedMessage.ALPHA[3][4] )
	$PlayfairGrid/Col5/R4C4.set_text( $TextOrganizer/EncryptedMessage.ALPHA[4][4] )
	
	
	$TextOrganizer/EncryptedMessage.set_text($TextOrganizer/EncryptedMessage._displayEncryptMessage(encText))
	
	$TextOrganizer/UserMessage.set_text($PlayfairGrid.userTextOut)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	
	$TextOrganizer/UserMessage.set_text($PlayfairGrid.userTextOut)
	
	if (isFinishedScene):
		pass


func _on_CheckDecryption_pressed():
	
	var user = $PlayfairGrid.userText
	
	decText = $TextOrganizer/EncryptedMessage._decryptMessage(encText)
	
	for i in len(user):
		if (decText[i] != user[i]):
			
			$TextOrganizer/IncorrectPrompt.set_text("Oooooh, so close!\n" + user[i] + " was INCORRECT")
			return
	
	$TextOrganizer/IncorrectPrompt.set_text("GREAT JOB!")
	isFinishedScene = true
	get_tree().change_scene("res://Scenes/Playfair/FullPlayFairGrid.tscn")