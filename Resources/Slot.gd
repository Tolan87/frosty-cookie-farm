extends Panel
class_name Slot

var slot_data: SlotData = null

func set_slot(data: SlotData) -> void:
	slot_data = data
	update_ui()

func clear_slot() -> void:
	slot_data = null
	update_ui()

func update_ui() -> void:
	print("%ItemTexture:", %ItemTexture, " class:", %ItemTexture.get_class())

	if slot_data == null or slot_data.item == null or slot_data.amount <= 0:
		%ItemTexture.visible = false
		%ItemAmount.visible = false
		return
		
	%ItemTexture.visible = true
	%ItemTexture.texture = slot_data.item.item_texture

	if slot_data.amount > 1:
		%ItemAmount.visible = true
		%ItemAmount.text = str(slot_data.amount)
	else:
		%ItemAmount.visible = false
