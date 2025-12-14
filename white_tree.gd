extends Node2D

@export var item: ItemData
var player = null

func _ready() -> void:
	player.collect(item)
