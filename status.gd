extends Node

func get_status(status: String, appeal: int, jam: int ):
	match status:
		"last":
			return self.last

func last(poke: Pokemon,appeal : int)-> int:
	if poke.turn_order == 3:	
		return appeal+3
	else:
		return appeal
