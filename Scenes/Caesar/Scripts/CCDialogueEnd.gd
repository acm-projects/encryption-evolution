extends RichTextLabel

# Array for the different text boxes
var dialogue = ["The note seems important...", "We need to get to the library soon!"]
var page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$NextScene.visible = false
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)

# Called whenever the mouse is pressed to change text
func _input(event):
	if event is InputEventMouseButton && event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialogue.size() - 1:
				page += 1
				set_bbcode(dialogue[page])
				set_visible_characters(0)
			
			else:
				$NextScene.visible = true
# Auto-scrolls text
func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)


func _on_NextScene_pressed():
	get_tree().change_scene("res://Scenes/Playfair_Prologue.tscn")
