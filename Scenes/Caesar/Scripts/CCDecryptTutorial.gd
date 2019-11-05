extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var rng = RandomNumberGenerator.new()
var shift = 0
var encMessage = ""
	

func _ready():
	rng.randomize()
	
	shift = rng.randi_range(1, 26)
	
	encMessage =  $Spinner._encryptor("GREAT JOB", shift)
	
	$"Key".set_text("Key Hint:\nInner " + $Spinner._changeLetter('A', shift, 1) + "\nOuter A")
	
	$"Encrypted Message".set_text(encMessage)

	$Next.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_check_Encrypted()

# checks if entered message is correctly encrypted
# called when the last letter of the word (D) is entered (see line 151) (should optimize later)
func _check_Encrypted():
	var encryptedMessage = "GREATJOB"
		
	var enteredMessage = ""
	
	for i in range($Spinner/SpinnerArea.label_dict.size()):       # combines every "Blank"'s text into one string
		var theBlank = $Spinner/SpinnerArea.label_dict.get(i)
		var theLetter = get_tree().get_root().get_node("CaesarCipher").find_node(theBlank).get_text()
		enteredMessage += theLetter
	
	if (enteredMessage == encryptedMessage):
		$"Encrypted Message".set_text("")
		$Next.visible = true
		$Backspace.visible = false
		$GoButton.visible = false


func _on_Next_pressed():
	get_tree().change_scene("res://Scenes/Caesar/Level1.tscn")