class_name PokemonCard extends Node2D

@onready var pokemon_name: Label = %"Pokemon Name"
@onready var sprite: TextureRect = %Sprite
@onready var moves: VBoxContainer = %Moves
@onready var add_move: Button = %AddMove

var sprite_path

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_labels(p: String,s: String, m: Array ) -> void:
	pokemon_name.text = p

	preload_poke(p)

	sprite.texture = sprite_path
	for i in m:
		print(i)
		var add_label = Label.new()
		add_label.text = i
		moves.add_child(add_label)
		
	pass

func preload_poke(p) -> void:
	match p:
		"Bulbasaur":
			sprite_path = preload("uid://eq2ye66xqtal")
		"Illumise":
			sprite_path = preload("uid://c5t0xsaqn6100")
		"Mudkip":
			sprite_path = preload("uid://3dwhyek2fpii")
		"Zigzagoon":
			sprite_path = preload("uid://dek30ydrroeu")
