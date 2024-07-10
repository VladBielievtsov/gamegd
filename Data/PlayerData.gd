class_name PlayerData
extends Resource

signal playerChanged(newPlayer: Player, oldPlayer: Player)
signal inventoryChanged(newInventory: Inventory, oldInventory: Inventory)

var player: Player :
	set(value):
		if (player == value):
			return
		
		var lastPlayer = player
		player = value
		playerChanged.emit(player, lastPlayer)
		
var inventory: Inventory :
	set(value):
		if (inventory == value):
			return
		
		var lastInventory = inventory
		inventory = value
		inventoryChanged.emit(inventory, lastInventory)
