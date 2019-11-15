extends RichTextLabel

# Array for the different text boxes
var dialogue = ["Well, I arrived, as requested. The note said nothing about the specifics, though. Where exactly do I go?", "Suddenly, it seemed like the world got darker. As I turned around, I found out why. A giant figure blocked my path, looming over me.","I see you got our message?", "!!! How exactly did a giant elephant sneak up on me?", "Are you the one I needed to see? What was the point of encrypting a call for help?", "He looked confused and, for a second, I thought that somehow we were both looking for the wrong people. Suddenly, he began to laugh.", "It’s elementary, friend! How could I be a secret agent without using secret messages?", "What.", "My look of confusion elicited another laugh from him as he took my arm and began to lead me somewhere.", "Yes, yes. A very hush hush organization, so keep your voice down. The name's Elliot by the way.", "I don't know why he told me to keep quiet when his voice is the only thing booming here. At least the library was empty.", "Eventually, we stand before a boring old door.", "Is this a joke? This is pretty shady-", "My voice trails off as Elliot opens the door, revealing a completely different decor. Machinery lines the wall and countless scientific notes are scattered on the ground.", "Pardon the mess, I didn't expect you to come here so fast.", "Is this what you needed help on? Cleaning your secret room?", "Elliot looks at me sadly, the mirth gone in his eyes.", "I wish that were the case. You see, our world might be in danger.", "He gestures to a machine I didn't notice before.","This, my friend, is a time machine. A little pet project of mine, I was able to peer into the past.", "However, a few days ago the machine malfunctioned. Thankfully no one was hurt, at least in the present, but I believe something went awry in the past. There are always going to be people who wish to mess with timelines.","I've been putting research into where the anomaly is and I was finally able to uncover an encrypted message that I unfortunately can't decode alone.","This is a lot to take in, I know. But I needed someone familiar enough with ciphers to help me fix this problem before something terrible happens.","He looked apologetically at me. I don't really have a choice in this matter, huh.","Show me the encrypted message.","Elliot looked at me, relieved by my words as he shuffled through papers, eventually handing me another paper of gibberish.","Now let's see, which cipher could this be..."]
# Shows which text box is currently in use
var page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
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
				get_tree().change_scene("res://Scenes/Playfair/PlayfairHowTo.tscn")

# Auto-scrolls text
func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
