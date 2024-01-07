extends Area2D

@export var itemRes: InvItem

func collect(inventory: Inv):
	#inventory.insert(itemRes)
	#queue_free()
	var item_added = inventory.insert(itemRes)
	if item_added:
		queue_free()
