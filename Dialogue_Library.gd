extends RichTextLabel

# Array for the different text boxes
var dialogue = ["Well, here's the library, as requested. I wonder where my mysterious note taker is...",
"Suddenly, it seemed like the world got darker. As I turned around, I found out why. A giant figure blocked my path, looming over me.",
"I see you got our message?", 
"!!! How exactly did a giant elephant sneak up on me?", 
"So you’re the one I needed to see. What was the point of encrypting a call for help?", 
"He looked confused and, for a second, I thought that somehow we were both looking for the wrong people. Suddenly, he began to laugh.", 
"It’s elementary, friend! How could I be a secret agent without using secret messages?", 
"What.", 
"In my confused state, he gently pulled me aside, leading me down a labyrinth of bookshelves and hallways.",
"Yes, yes. I'm sure you're confused, but we have work to do! Call me Elliot, by the way.",
"Eventually, we came across an inconspicuous door. Was this a joke?", 
"All this for a door? What exactly do you mean by wo-", 
"My voice trailed off as Elliot opened the door, revealing a dark room filled with machinery.", 
"Elliot looked triumphantly at me. As we entered the room, a giant machine came into view, taking up much of the space.", 
"My prized possession. A time machine!", 
"I could only gape.",
"Now, for business. This little machine of mine has allowed me to travel throughout time, however it began to have some trouble recently. Some research has allowed me to discover an anomaly.",
"Working on finding where the anomaly allowed me to find a message, however it's frustratingly encoded.",
"That is where you come in! I apologize if this is a lot to take in but you are integral to saving the world!",
"...",
"Hand me the paper.",
"Elliot looked at me in surprise, then happiness filled his face.",
"Good luck, friend. The fate of the world rests in your hands."]
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

# Auto-scrolls text
func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
