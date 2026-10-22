extends Node2D

@onready var hearts: HBoxContainer = $Hearts

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var current_p
	for child in self.get_children():
		if child.name == "Pokemon":
			Global.current_pokemon = child		
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_moves_pressed() -> void:
	print("display moves")
	Global.current_pokemon.display_moves()


func _on_apply_moves_pressed() -> void:
	print(Global.current_move)
	generate_hearts()
	pass # Replace with function body.

#appeal
func generate_hearts() -> void:

	var xpos = 0
	for h in Global.current_move.appeal:

		var heart = Sprite2D.new()
		heart.texture = preload("uid://ubngea14khip")
		heart.position.x += xpos
		xpos += 100
		print(heart)
		print(hearts)
		hearts.add_child(heart)
		print(h)
		
		
	#get current move's appeal
	#create X number of hearts 
	pass
