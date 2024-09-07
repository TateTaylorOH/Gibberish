Scriptname EC_SS_GibberExchanger extends ReferenceAlias

MiscObject Property DES_GibberBack auto
MiscObject Property DES_GibberFront auto
MiscObject Property DES_Gibber auto
GlobalVariable Property EC_SS_GoldChanceNone auto
GlobalVariable Property EC_SS_GibberChanceNone auto
Actor Property PlayerRef auto

float value
bool defaultPath = true

Event OnInit()
	value = 0
	EC_SS_GoldChanceNone.setValue(100.0)
	EC_SS_GibberChanceNone.setValue(0.0)
	AddInventoryEventFilter(DES_GibberBack)
	AddInventoryEventFilter(DES_GibberFront)
	RegisterForMenu("TweenMenu")
endEvent

Event OnPlayerLoadGame()
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(DES_GibberBack)
	AddInventoryEventFilter(DES_GibberFront)
	RegisterForMenu("TweenMenu")
	IF PlayerRef.GetItemCount(DES_GibberBack) > 0
		ConvertDementiaGibber(DES_GibberBack)
	ENDIF
	IF PlayerRef.GetItemCount(DES_GibberFront) > 0
		ConvertManiaGibber(DES_GibberFront)
	ENDIF
endEvent

Event OnMenuOpen(String MenuName)
	IF MenuName == "TweenMenu"
		IF defaultPath == true
			DES_Gibber.SetWorldModelPath("COIN/OneGibberBack.nif")
			DES_Gibber.SetGoldValue(DES_GibberBack.GetGoldValue())
			defaultPath = false
		ELSEIF defaultPath == false
			DES_Gibber.SetWorldModelPath("COIN/OneGibberFront.nif")
			DES_Gibber.SetGoldValue(DES_GibberFront.GetGoldValue())
			defaultPath = true
		ENDIF
	ENDIF
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akBaseItem == DES_GibberBack
		ConvertDementiaGibber(akBaseItem)
	elseif akBaseItem == DES_GibberFront
		ConvertManiaGibber(akBaseItem)
	endIf
EndEvent

function ConvertDementiaGibber(Form akBaseItem)
	MiscObject coin = akBaseItem as MiscObject
	float valueMult = 1.0
	if(Quest.getQuest("DES_CoinHandler"))
		valueMult = (Quest.GetQuest("DES_CoinHandler") as DES_CoinManager).getCoinValue(coin)
	endif
	if(valueMult > 0.0)
		int count = PlayerRef.getItemCount(akBaseItem)
		PlayerRef.removeItem(akBaseItem, count, true)
		value += count * valueMult
		count = value as int
		value -= count as float
		PlayerRef.addItem(DES_Gibber, count, true)
		DES_Gibber.SetGoldValue(akBaseItem.GetGoldValue())
	endif
endfunction

function ConvertManiaGibber(Form akBaseItem)
	MiscObject coin = akBaseItem as MiscObject
	float valueMult = 1.6
	if(Quest.getQuest("DES_CoinHandler"))
		valueMult = (Quest.GetQuest("DES_CoinHandler") as DES_CoinManager).getCoinValue(coin)
	endif
	if(valueMult > 0.0)
		int count = PlayerRef.getItemCount(akBaseItem)
		PlayerRef.removeItem(akBaseItem, count, true)
		value += count * valueMult
		count = value as int
		value -= count as float
		PlayerRef.addItem(DES_Gibber, count, true)
		DES_Gibber.SetGoldValue(akBaseItem.GetGoldValue())
	endIf
endFunction
