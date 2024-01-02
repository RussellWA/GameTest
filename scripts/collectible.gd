extends Area2D

signal collected(name, weight)

const Player = preload("res://scripts/player.gd")

var weight = 10  # Adjust weight as needed

func _on_body_entered(body):
	if body is Player:
		on_collect()
		queue_free()  # Remove from scene

func on_collect():
	# Add to inventory or apply effects here
	print("Collectible collected!")
	collected.emit("fish", weight)
