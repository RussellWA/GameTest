extends Area2D

@export var itemRes: InvItem

func collect(inventory: Inv):
	inventory.insert(itemRes)
	queue_free()
