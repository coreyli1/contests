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


func avoid(poke: Pokemon):
	poke.avoid = true
	
func copyprev(poke: Pokemon, current_appeal: int):
	if poke.turn_order == 0:
		return current_appeal
	else:
		return Global.turn_order[poke.turn_order-1].current_appeal
	pass
func startle(poke: Pokemon):
	
	pass
