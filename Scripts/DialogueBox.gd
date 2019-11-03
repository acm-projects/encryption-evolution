extends RichTextLabel

# Array for the different text boxes
var dialogue = ["It's another lovely day in town, relaxing at your favorite cafe and reading up on the current news.",
"Everything was normal, peaceful and...boring.",
"A little too boring. I wish there could be some excitement in my life...", 
"Lost in thought, I wasn't aware of a teetering stack of plates until it was too late...", 
"*CRASH*", 
"Ah, so sorry about that!", 
"A waiter looked at me apologetically, frantically trying to clean up the spiill on my table.", 
"No worries! Hey, you dropped something...", 
"I mean a lot of things were dropped, but there was a piece of paper that fluttered over the mess.",
"Wait! They're already gone? They totally just ignored me.",
"I guess it doesn't hurt to look at what they left...", 
"Scribbles, huh. Looks like gibberish to me.", 
"???", 
"Something about this seems... familiar somehow...", 
"There's a circle drawn next to the gibberish...!!! A cipher!", 
"Now to remember how it works..."]
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
