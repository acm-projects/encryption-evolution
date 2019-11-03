extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Set center as 0, 0
	position = Vector2(0, 0)
	
	#Left side
	if look_at(InputEventScreenTouch.Vector2().x) < position.x:
		if look_at(InputEventScreenTouch.Vector2().y) > position.y:
			 $AnimatedSprite.input(Input.is_action_pressed("ui_left"))
			
		else:
			$AnimatedSprite.isinput(Input.is_action_pressed("ui_right"))
	
	else:
		if look_at(InputEventScreenTouch.Vector2().y) > position.y:
			 $AnimatedSprite.input(Input.is_action_pressed("ui_right"))
			
		else:
			$AnimatedSprite.input(Input.is_action_pressed("ui_left"))
	
	
	
	
	
	
	pass
