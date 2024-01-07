extends Resource

class_name Inv

signal updated

@export var items: Array[InvItem]
@export var max_weight = 15

func insert(item: InvItem):
	var total_weight = 0
	for fish in items:
		if fish:
			total_weight += item.weight
	
	if total_weight + item.weight <= max_weight:
		items.push_back(item)
		updated.emit()
		return true
	else:
		return false
	
	updated.emit()
