extends Label

func _ready():
	
	pass

func _on_button_pressed():
	get_node("Label").set_text("In town...")
	get_node("Label").get_text()
	get_node("Label").set_text("next line")