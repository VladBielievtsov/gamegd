extends Interactable

@export var isOpen = false


@export var animation: AnimationPlayer

@export_group("Animation Names")
@export var onAnim: StringName = "Open"
@export var offAnim: StringName = "Close"

func interact(user: Node2D):
	if (isOpen == false):
		isOpen = true
		animation.play(onAnim)
		print_debug("Chest Open")

func stopInteraction(user: Node2D):
	if (isOpen == true):
		isOpen = false
		animation.play(offAnim)
		print_debug("Chest Close")
