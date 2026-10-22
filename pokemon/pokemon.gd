class_name Pokemon extends Node2D


@export var pokemon_name: String = "Pokemon"
@export var attribute: String = "CUTE"
@export var moves :Array[move] 


@onready var poke_name: Label = %PokeName
@onready var moves_group: GridContainer = $Control/MovesGroup




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#set label to be the pokemon_name
	poke_name.text = pokemon_name
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func display_moves() -> void:
	moves_group.visible = true
	
