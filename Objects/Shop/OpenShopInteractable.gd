class_name OpenShopInteractable
extends Interactable

@export var ShopUI: Control

func interact(user: Node2D):
	if (ShopUI.visible):
		ShopUI.hide()
		ShopUI.user = null
	else:
		ShopUI.show()
		ShopUI.user = user

func stopInteraction(user: Node2D):
	ShopUI.hide()
