extends Area2D

signal startFishTime
signal stopFishTime

func fishy():
	startFishTime.emit()

func fishnt():
	stopFishTime.emit()
