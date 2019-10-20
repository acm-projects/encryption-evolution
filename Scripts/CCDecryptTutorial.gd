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
	
	$"Encrypted Message".set_text(encMessage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var user = $Spinner/SpinnerArea.userWord
	var realMessage = $Spinner._decryptor(encMessage, shift)
	var answer = ""
	
	for i in len(realMessage):
		if realMessage[i] != ' ':
			answer = answer + realMessage[i]
	
	if ($"Decrypted Message/LetterRow2/Blank8".get_text() != '_'):
		
		for i in len(user):
			if (user[i] != answer[i]):
				return 
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Real Decryption Intro.tscn")
		
				
				
	