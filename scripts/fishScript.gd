extends Node2D

signal getFishAction

var inarea = false
@onready var fishGUI = $CanvasLayer/CenterContainer/FishingGui
var fishes = preload("res://scenes/fish.tscn")

func _ready():
	fishGUI.hide()
	var fishArea = get_node("fishingArea")
	fishArea.startFishTime.connect(fishTime)
	fishArea.stopFishTime.connect(fishntTime)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inarea == true && Input.is_action_just_pressed("f"):
	#if Input.is_action_just_pressed("f"):
		spawnFish()
	
func fishTime():
	fishGUI.show()
	inarea = true

func fishntTime():
	fishGUI.hide()
	inarea = false
	
func spawnFish():
	var instance = fishes.instantiate()
	instance.position = $player.get_position()
	add_child(instance)
