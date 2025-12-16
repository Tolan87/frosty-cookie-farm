extends StaticBody2D

var plant = GlobalSignals.plantSelected
var plantGrowing = false
var plantGrown = false 

var flowerPurpleItem = preload("res://flower_purple_collectable.tscn")

func _physics_process(delta: float) -> void:
	if plantGrowing == false: 
		plant = GlobalSignals.plantSelected

func _on_area_2d_area_entered(area: Area2D) -> void:
	if not plantGrowing: 
		if plant == 1:
			plantGrowing = true
			$flowerPurpleTimer.start()
			$plant.play("flowerPurpleGrowing")
		if plant == 2: 
			plantGrowing = true
			$flowerWhiteTimer.start()
			$plant.play("flowerWhiteGrowing")
			
		else: 
			print('plant is already growing here')


func _on_flower_purple_timer_timeout() -> void:
	var flowerPurple = $plant
	print(flowerPurple.frame)
	
	if flowerPurple.frame == 0:
		flowerPurple.frame = 1
		$flowerPurpleTimer.start()
	elif flowerPurple.frame == 1:
		flowerPurple.frame = 2
		$flowerPurpleTimer.start()
	elif flowerPurple.frame == 2:
		flowerPurple.frame = 3
		plantGrown = true


func _on_flower_white_timer_timeout() -> void:
	var flowerWhite = $plant
	print(flowerWhite.frame)
	
	if flowerWhite.frame == 0:
		flowerWhite.frame = 1
		$flowerWhiteTimer.start()
	elif flowerWhite.frame == 1:
		flowerWhite.frame = 2
		$flowerWhiteTimer.start()
	elif flowerWhite.frame == 2:
		flowerWhite.frame = 3
		plantGrown = true


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("mouse_left"):
		if plantGrown: 
			if plant == 1:
				GlobalSignals.numOfFlowerPurple += 1
				plantGrowing = false
				plantGrown = false
				$plant.play("none")
				drop_item(plant)
			if plant == 2:
				GlobalSignals.numOfFlowerWhite += 1
				plantGrowing = false
				plantGrown = false
				$plant.play("none")
				drop_item(plant)
			else:
				pass
				
func drop_item(plant: int):
	if plant == 1: 
		var flowerPurple_instance = flowerPurpleItem.instantiate()
		
		flowerPurple_instance.global_position = $Marker2D.global_position
		get_parent().add_child(flowerPurple_instance)

		await get_tree().create_timer(3).timeout
		

		
