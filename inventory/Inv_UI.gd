extends Control

@onready var inv: Inv = preload("res://inventory/playerInv.tres")
@onready var grid_container: GridContainer = $NinePatchRect/GridContainer

var is_open = false

func _ready():
	inv.updated.connect(_on_inv_updated)
	close()

func _on_inv_updated():
	_rebuild_slots()

func _rebuild_slots():
	for child in grid_container.get_children():
		child.queue_free()  # Free each child node
	
	# Recreate slots based on inventory items
	var num_items = inv.items.size()
	var slot_template = preload("res://inventory/inv_ui_slot.tscn")  # Replace with your slot template scene

	for i in range(num_items):
		var slot = slot_template.instantiate()
		grid_container.add_child(slot)
		slot.update(inv.items[i])

func _process(delta):
	if Input.is_action_just_pressed("i"):
		if is_open:
			close()
		else:
			open()

func open():
	self.visible = true
	is_open = true

func close():
	visible = false
	is_open = false
