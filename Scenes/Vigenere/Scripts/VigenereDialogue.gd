extends RichTextLabel

# Array for the different text boxes
var dialogue = ["Henry III, huh. That's a French king, right?", 
"Elliot looked at me confused for a second, then rushed over to the time machine.",
"Give me a moment, then...a few adjustments to these gears, and... Voila! 16th century France ho!",
"And that's how we got here, in a French palace hundreds of years in the past.", 
"Hello? Is anyone home?", 
"I don't know why I called out. I can't speak French and our futuristic clothes would make us stick out like a sore thumb.", 
"There was no reason to fear being conspicuous, though. We haven't encountered a single soul as we wandered aimlessly through the palace.", 
"After a few more minutes of walking down endless halls, Elliot speaks up.", 
"Hold up. I believe I can feel an anomaly.", 
"He was right. I could feel something...strange ahead of us, almost like there was something wrong.", 
"As we moved a little further, the feeling got worse. Eventually it became a pain throughout my entire body, like it was going to tear me apart.", 
"Elliot winced as he pulled out a small remote, similar in appearance to the time machine we used.", 
"A time rift. Probably caused by negligence of another time traveler.", 
"He points the remote of a space in front of us, suddenly creating a strange tear in the fabric of reality.", 
"Quickly now! I need you to decipher this code! It should be able to stitch up the rift once solved!", 
"Elliot tosses the remote to me and I fumble to grab it, my hands shaking with worry.", 
"I take a deep breath, trying to calm my nerves.", 
"There's no time to be nervous. It's time to save the world."]
# Shows which text box is currently in use
var page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$ContinueButton.visible = false
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)

# Called whenever the mouse is pressed to change text
func _input(event):
	if event is InputEventMouseButton && event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialogue.size()-1:
				page += 1
				set_bbcode(dialogue[page])
				set_visible_characters(0)
			else:
				$ContinueButton.visible = true

# Auto-scrolls text
func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)

func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Scenes/Vigenere/VigenereHowTo.tscn")
