extends StaticBody2D

func _ready():
	dropItem()
	
func dropItem():
	$AnimationPlayer.play("drop_item")
	await get_tree().create_timer(1.5).timeout
	$AnimationPlayer.play("fade")
	print("+1 item")
	await get_tree().create_timer(0.3).timeout
