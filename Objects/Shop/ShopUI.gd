class_name ShopUI
extends Control

@export var userLabel: Label
@export var moneyLabel: Label

var user: Node2D :
	set(value):
		user = value
		if (user != null):
			userLabel.text = "User: " + user.name
			
			for child in user.find_children("", "Inventory", true, true):
				if (child is Inventory):
					userInventory = child
		else:
			userInventory = null

var userInventory: Inventory :
	set(value):
		if (userInventory != null):
			userInventory.moneyChanged.disconnect(_onUserInventoryMoneyChanged)
		userInventory = value
		
		if (userInventory != null):
			moneyLabel.text = "Money: " + str(userInventory.money)
			userInventory.moneyChanged.connect(_onUserInventoryMoneyChanged)
		else:
			moneyLabel.text = "Money: <N/A>"

func _onUserInventoryMoneyChanged(new: int, old: int):
	moneyLabel.text = "Money: " + str(new)
