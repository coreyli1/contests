extends Node2D


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
	print("move")
	print(Global.current_pokemon.display_moves())
	
	#on moves pressed, i want to grab the pokemon and display the moves
	#do i need a script and a 
	pass # Replace with function body.
