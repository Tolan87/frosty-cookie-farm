extends StaticBody2D

func _ready():
	dropItem()
	
func dropItem():
	$AnimationPlayer.play("drop_item")
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.play("idle")
	await get_tree().create_timer(5.0).timeout
	$AnimationPlayer.play("fade")
	await get_tree().create_timer(0.3).timeout
