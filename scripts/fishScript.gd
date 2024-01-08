extends Node2D

@onready var fishGUI = $CanvasLayer/CenterContainer/FishingGui

func _ready():
	fishGUI.hide()
	var fishArea = get_node("fishingArea")
	fishArea.startFishTime.connect(fishTime)
	fishArea.stopFishTime.connect(fishntTime)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if Input.is_action_pressed("f"): #debugging shit
		#fishGUI.show()
	#else:
		#fishGUI.hide()
	
func fishTime():
	fishGUI.show()

func fishntTime():
	fishGUI.hide()
