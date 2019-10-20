extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ALPHA = [['A', 'B', 'C', 'D', 'E'],  ['F', 'G', 'H', 'I', 'J'], ['K', 'L', 'M', 'N', 'O'], ['P', 'R', 'S', 'T', 'U'], ['V', 'W', 'X', 'Y', 'Z']]

var key = "keyword" 
var message = "message"

# Called when the node enters the scene tree for the first time.
func _ready():
	_createEncryptGrid(key) 
	_encryptMessage(message)
	pass # Replace with function body.

#Check if the letter is in the keyword
func _checkKey(key, letter):
	
	for i in range(len(key)):
		
		if ((key[i]).to_upper() == char(letter)):
			return false
			
	return true
	
#Takes out the duplicates of letter in the key
func _deleteDuplicates(key):
	var temp = key
	
	var realKey = ""
	var letter = ''
	
	for i in len(temp):
		
		letter = temp[i] #Letter to check against other letters
		
		#Check the many letters after it 
		for j in len(temp): 
		
			#Put space if the letters match
			if (j > i && temp[j] == letter): 
				temp[j] = ' '
	
	#Delete the spaces
	for i in len(temp):
		if (temp[i] != ' '):
			realKey = realKey + temp[i]
	
	
	return realKey
	
#Creating full encryption gird with the key
func _createEncryptGrid(key):

	var index = 0
	var letter = 65 #ASCII val for 'A'
	
	var actualKey = _deleteDuplicates(key)
	
	for i in range(len(ALPHA)):
		
		for j in range(len(ALPHA[i])):
			
			#Put key into the array first
			if (index < len(actualKey)):
				ALPHA[i][j] =(actualKey[index]).to_upper()
				index += 1
			
			#Put rest of the alphabet without duplicates in
			#the array
			
			else:
				#If the letter already exist in the key
				#OR if the letter is Q
				#Go to the next letter
				while( !(_checkKey(actualKey, letter)) || char(letter) == 'Q' ):
					letter += 1
				
				#The letter does not exist in the key
				#AND letter is not Q
				ALPHA[i][j] = char(letter)
				letter += 1  #Get to the next ASCII letter value
			
			#DEBUG STATEMENT
			print(ALPHA[i][j])

#Encrypt the message with the EncryptGrid
func _encryptMessage(message):
	
	#Alter = Change message so it can be encrypted
	var alter = "" 
	
	#Hidden = Encrypted message
	var hidden = ""
	
	#If there is any duplicate letters right next
	#to each other, put an "X" between them
	#Ex: "message" -> "MESXSAGE"
	for i in len(message):
		if i != (len(message) - 1):
			
			#Placing "X" between the sme two letters
			if (message[i] == message[i + 1]):
				alter = alter + message[i].to_upper() + 'X'
				
			else:
				alter = alter + message[i].to_upper()
		
		#If it is the last letter of the message 
		#Put it to the end
		else:
			alter = alter + message[i].to_upper()
			
	#Add "X" to Hidden word if the length is odd
	if (len(alter) % 2 != 0):
			alter = alter + 'X'

	#Actcually encrypting the message with the ALPHA KEY (Encrypt Grid)
	var i = 0
	while (i < len(alter)):
		#Position of letter 1
		var pos1 = _findLetter(alter[i])
		
		#Position of letter 2
		var pos2 = _findLetter(alter[i + 1])

		#[0] -> rows, Check if letters in the same row
		#New letter = 1 letter to the right of old letter
		#Same row, column + 1
		if (pos1[0] == pos2[0]):
			
			if (pos1[1] + 1 >= 5): #If column + 1 is 
				hidden = hidden + ALPHA[ pos1[0] ][ pos1[1] + 1 - 5 ]
				
			else:
				hidden = hidden + ALPHA[ pos1[0] ][ pos1[1] + 1 ]
				
			if (pos1[1] + 1 >= 5):
				hidden = hidden + ALPHA[ pos2[0] ][ pos2[1] + 1 - 5 ]
			
			else:
				hidden = hidden + ALPHA[ pos2[0] ][ pos2[1] + 1 ]
				
		#[1] -> col, Check if letter in same column
		#New letter = 1 letter below the old letter
		#row + 1, same column
		elif (pos1[1] == pos2[1]):
			
			if (pos1[0] + 1 >= 5):
				hidden = hidden + ALPHA[ pos1[0] + 1 - 5 ][ pos1[1] ]
				
			else:
				hidden = hidden + ALPHA[ pos1[0] + 1 ][ pos1[1] ]
			
			if (pos2[0] + 1 >= 5):
				hidden = hidden + ALPHA[ pos2[0] + 1 - 5 ][ pos2[1] ]
				
			else:
				hidden = hidden + ALPHA[ pos2[0] + 1 ][ pos2[1] ]
			
		#New Letter 1 = row of Letter 1, col of Letter 2
		#New Letter 2 = row of Letter 2, col of Letter 1
		else:
			hidden = hidden + ALPHA[ pos1[0] ][ pos2[1] ]
			hidden = hidden + ALPHA[ pos2[0] ][ pos1[1] ]
			
		i += 2
		
	print(hidden, "\n") #DEBUG STATEMENT
	
#Find the letter in the Encrypt Grid
func _findLetter(letter):
	
	#row_col[0] = row number
	#row_col[1] = col number
	var row_col = [-1, -1]
	
	for row in range(len(ALPHA)):
		
		for col in range(len(ALPHA[row])):
			
			if (ALPHA[row][col] == letter):
				
				row_col[0] = row
				row_col[1] = col
				
				return row_col

