extends Label

var ascii_chart = {'A': 0, 'B': 1, 'C': 2, 'D': 3, 'E': 4,
				   'F': 5, 'G': 6, 'H': 7, 'I': 8, 'J': 9,
				   'K': 10, 'L': 11, 'M': 12, 'N': 13, 'O': 14,
				   'P': 15, 'Q': 16, 'R': 17, 'S': 18, 'T': 19,
				   'U': 20, 'V': 21, 'W': 22, 'X': 23, 'Y': 24,
				   'Z': 25}

#func _ready():
	
#	var encrypt = _encryptor("KEY", "FAKE NEWS")

func getNumString(message):
	var numString = ""
	
	for i in range(message.length()):
		numString += str(ascii_chart[message[i]])
	
	return numString

#Parameters:
#	Key
#	Message
#Return:
#	Encrypted Message
func _encryptor(key, message):
	
	var realKey = ""
	var encrypted = ""
	var index = 0
	
	#Traverse thru message to develop
	#realKey
	#Ex: key = "KEY"
	#	 message = "FAKE NEWS"
	#	 realKey = "KEYK EYKE"
	for i in len(message):
		
		if message[i] == ' ':
			realKey = realKey + ' '
		
		else:
			
			if (index == (len(key))): #Make index = 0 to get a
				index = 0			  #specific character from key
				
			realKey = realKey + key[ index ]
			index += 1
	
	#Actually Encrypt the Message
	for j in len(message):
		
		if message[j] == ' ':
			encrypted = encrypted + ' '
		
		else:
			#Use the 0 - 25 to represent A - Z with the ascii_chart
			#to give an encrypted letter (aka newChar)
			#Mod by 26 to not go over 
			var newChar = (ascii_chart[ message[j] ] + ascii_chart[ realKey[j] ]) % 26
			
			newChar = newChar + 65 #Actual ASCII value of newChar
			
			encrypted = encrypted + char(newChar)
	
	return encrypted
	
#Parameters:
#	Key
#	Encrypted Message
#Return:
#	Real Message
func _decryptor(key, encryptedMessage):
	
	var realKey = ""
	var realMessage = ""
	var index = 0
	
	#Traverse thru message to develop
	#realKey
	#Ex: key = "KEY"
	#	 message = "FAKE NEWS"
	#	 realKey = "KEYK EYKE"
	for i in len(encryptedMessage):
		
		if encryptedMessage[i] == ' ':
			realKey = realKey + ' '
		
		else:
			
			if (index == (len(key))): #Make index = 0 to get a
				index = 0			  #specific character from key
				
			realKey = realKey + key[ index ]
			index += 1
	
	#Actually Decrypt the Message
	for j in len(encryptedMessage):
		
		if encryptedMessage[j] == ' ':
			realMessage = realMessage + ' '
		
		else:
			#Use the 0 - 25 to represent A - Z with the ascii_chart
			#to give the decrypted letter (aka newChar)
			#Mod by 26 to not go over 
			var newChar = (ascii_chart[ encryptedMessage[j] ] - ascii_chart[ realKey[j] ] + 26) % 26
			
			newChar = newChar + 65 #Actual ASCII value of newChar
			
			realMessage = realMessage + char(newChar)
		
	return realMessage
	
	
	
	
	
	
	
	