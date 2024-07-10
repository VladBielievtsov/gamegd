class_name Inventory
extends Node

signal moneyChanged(new: int, old: int)

@export var money: int = 0 :
	set(value):
		if (money == value):
			return
		
		var lastMoney = money
		money = value
		moneyChanged.emit(money, lastMoney)
