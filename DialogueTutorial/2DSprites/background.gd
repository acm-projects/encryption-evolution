extends Sprite

func _ready():
  #draw in the middle of the screen
  position = Vector2(get_viewport().size.x/2,get_viewport().size.y/2)
#scale to 30%
  scale = Vector2(0.3,0.3)