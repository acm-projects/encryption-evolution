extends HBoxContainer

var userTextOut = "__ __ __ __ __" #This is displayed
var userText = "__________" #This is internal
var index = 0
var outIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument

func _index():
	
	
	
	if (index > len(userText)):
		index = len(userText)
	
	if (outIndex > len(userTextOut)):
		outIndex = len(userTextOut)
	
	#Skip the space
	if (outIndex == 2):
		outIndex += 1
	
	elif (outIndex == 5):
		outIndex += 1
	
	elif (outIndex == 8):
		outIndex += 1
	
	elif (outIndex == 11):
		outIndex += 1
	
	elif (outIndex == 14):
		outIndex += 1

func _checkIndex():
	
	if (index == len(userText) || outIndex == len(userTextOut)):
		return false
		
	return true

#Button: ## = RC
#R -> Row
#C -> Col

#Column 1 Buttons

func _on_00_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col1/R0C0".get_text() )
		userTextOut[outIndex] = ( $"Col1/R0C0".get_text() )
	
		index += 1
		outIndex += 1
		_index()	
	
	userText[index] = ( $"Col1/R0C0".get_text() )
	userTextOut[outIndex] = ( $"Col1/R0C0".get_text() )
	

func _on_10_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col1/R1C0".get_text() )
		userTextOut[outIndex] = ( $"Col1/R1C0".get_text() )
	
		index += 1
		outIndex += 1
		_index()


func _on_20_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col1/R2C0".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col1/R2C0".get_text() )
		outIndex += 1
		_index()


func _on_30_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col1/R3C0".get_text() )
		index += 1

		userTextOut[outIndex] = ( $"Col1/R3C0".get_text() )
		outIndex += 1
		_index()

func _on_40_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col1/R4C0".get_text() )
		index += 1

		userTextOut[outIndex] = ( $"Col1/R4C0".get_text() )
		outIndex += 1
		_index()


#Column 2 Buttons

func _on_01_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col2/R0C1".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col2/R0C1".get_text() )
		outIndex += 1
		_index()

func _on_11_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col2/R1C1".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col2/R1C1".get_text() )
		outIndex += 1
		_index()

func _on_21_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col2/R2C1".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col2/R2C1".get_text() )
		outIndex += 1
		_index()


func _on_31_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col2/R3C1".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col2/R3C1".get_text() )
		outIndex += 1
		_index()


func _on_41_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col2/R4C1".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col2/R4C1".get_text() )
		outIndex += 1
		_index()

#Column 3 Buttons

func _on_02_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col3/R0C2".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col3/R0C2".get_text() )
		outIndex += 1
		_index()


func _on_12_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col3/R1C2".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col3/R1C2".get_text() )
		outIndex += 1
		_index()


func _on_22_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col3/R2C2".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col3/R2C2".get_text() )
		outIndex += 1
		_index()


func _on_32_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col3/R3C2".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col3/R3C2".get_text() )
		outIndex += 1
		_index()


func _on_42_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col3/R4C2".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col3/R4C2".get_text() )
		outIndex += 1
		_index()
	
#Column 4 Buttons

func _on_03_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col4/R0C3".get_text() )
		index += 1

		userTextOut[outIndex] = ( $"Col4/R0C3".get_text() )
		outIndex += 1
		_index()

func _on_13_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col4/R1C3".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col4/R1C3".get_text() )
		outIndex += 1
		_index()


func _on_23_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col4/R2C3".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col4/R2C3".get_text() )
		outIndex += 1
		_index()


func _on_33_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col4/R3C3".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col4/R3C3".get_text() )
		outIndex += 1
		_index()


func _on_43_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col4/R4C3".get_text() )
		index += 1

		userTextOut[outIndex] = ( $"Col4/R4C3".get_text() )
		outIndex += 1
		_index()

#Column 5 Buttons

func _on_04_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col5/R0C4".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col5/R0C4".get_text() )
		outIndex += 1
		_index()


func _on_14_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col5/R1C4".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col5/R1C4".get_text() )
		outIndex += 1
		_index()


func _on_24_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col5/R2C4".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col5/R2C4".get_text() )
		outIndex += 1
		_index()


func _on_34_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col5/R3C4".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col5/R3C4".get_text() )
		outIndex += 1
		_index()

func _on_44_pressed():
	
	if (_checkIndex()):
		userText[index] = ( $"Col5/R4C4".get_text() )
		index += 1
	
		userTextOut[outIndex] = ( $"Col5/R4C4".get_text() )
		outIndex += 1
		_index()

func _on_Back_pressed():
	outIndex -= 1
	index -= 1
	
	if (index < 0): 
		index = 0
		
	if (outIndex < 0):
		outIndex = 0
		
	userText[index] = '_'
	
	if (outIndex == 2):
		outIndex -= 1

	elif (outIndex == 5):
		outIndex -= 1
	
	elif (outIndex == 8):
		outIndex -= 1
	
	elif (outIndex == 11):
		outIndex -= 1
	
	elif (outIndex == 14):
		outIndex -= 1
	
	userTextOut[outIndex] = '_'