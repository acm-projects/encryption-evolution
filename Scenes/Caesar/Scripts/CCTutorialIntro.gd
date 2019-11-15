extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var tut = ["Tutorials:\nEach level has 2-3 tutorials to help you learn how to encrypt and decrypt with the cipher",
 "Tutorials:\nFor Caesar Cipher, find the shift number to have the key and decrypt the message. Follow the Wheel!"]
var i = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().get_node("CaesarCipher").find_node("Tutorial Help").set_text(tut[i])
	i = i + 1
func _on_Continue_pressed():
	if (i < len(tut)):
		get_tree().get_root().get_node("CaesarCipher").find_node("Tutorial Help").set_text(tut[i])
	
	if (i >= len(tut)):
		print("i > len(tut)")
		get_tree().change_scene("res://Scenes/Caesar/Level1Tutorial1.tscn")
		
	i = i + 1