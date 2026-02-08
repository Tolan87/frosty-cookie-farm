class_name HotbarData extends Resource

signal update

@export var size: int = 9
@export var slots: Array[SlotData] = []

func _init():
	for i in range(size):
		slots.append(SlotData.new())
			
func insert_hotbar(item: ItemData) -> void:
	for i in range(slots.size()):
		if slots[i] != null and slots[i].item == item:
			slots[i].amount += 1
			update.emit()
			return
	
	for i in range(slots.size()):
		slots[i].item = item
		slots[i].amount = 1
		update.emit()
		return

	print("Inventar ist voll")
