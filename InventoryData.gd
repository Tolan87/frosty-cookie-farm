extends Resource
class_name InventoryData

signal update
@export var slots: Array[SlotData] = []

func insert(item: ItemData) -> void:
	for slot in slots:
		if slot.item == item and slot.item != null:
			slot.amount += 1
			update.emit()
			return

	for slot in slots:
		if slot.item == null:
			slot.item = item
			slot.amount = 1
			update.emit()
			return

	print("Inventar ist voll")
	update.emit()
