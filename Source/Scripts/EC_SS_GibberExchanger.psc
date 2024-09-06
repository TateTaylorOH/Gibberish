Scriptname EC_SS_GibberExchanger extends ReferenceAlias

MiscObject Property DES_GibberBack auto
MiscObject Property DES_GibberFront auto
MiscObject Property DES_Gibber auto
GlobalVariable Property EC_SS_GoldChanceNone auto
GlobalVariable Property EC_SS_GibberChanceNone auto

Actor ref
float value
bool defaultPath = true

Event OnInit()
	ref = getReference() as Actor
	value = 0
	EC_SS_GoldChanceNone.setValue(100.0)
	EC_SS_GibberChanceNone.setValue(0.0)
	AddInventoryEventFilter(DES_GibberBack)
	AddInventoryEventFilter(DES_GibberFront)
	RegisterForMenu("InventoryMenu")
endEvent

Event OnPlayerLoadGame()
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(DES_GibberBack)
	AddInventoryEventFilter(DES_GibberFront)
	RegisterForMenu("InventoryMenu")
	IF ref.GetItemCount(DES_GibberBack) > 0
		ConvertDementiaGibber(DES_GibberBack)
	ENDIF
	IF ref.GetItemCount(DES_GibberFront) > 0
		ConvertManiaGibber(DES_GibberFront)
	ENDIF
endEvent

Event OnMenuClose(String MenuName)
	IF MenuName == "InventoryMenu"
		IF defaultPath == true
			DES_Gibber.SetWorldModelPath("COIN/OneGibberBack.nif")
			defaultPath = false
		ELSEIF defaultPath == false
			DES_Gibber.SetWorldModelPath("COIN/OneGibberFront.nif")
			defaultPath = true
		ENDIF
	ENDIF
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akBaseItem == DES_GibberBack
		ConvertManiaGibber(akBaseItem)
	elseif akBaseItem == DES_GibberFront
		ConvertDementiaGibber(akBaseItem)
	endIf
EndEvent

function ConvertManiaGibber(Form akBaseItem)
	MiscObject coin = akBaseItem as MiscObject
	float valueMult = 1.0
	if(Quest.getQuest("DES_CoinHandler"))
		valueMult = (Quest.GetQuest("DES_CoinHandler") as DES_CoinManager).getCoinValue(coin)
	endif
	if(valueMult > 0.0)
		int count = ref.getItemCount(akBaseItem)
		ref.removeItem(akBaseItem, count, true)
		value += count * valueMult
		count = value as int
		value -= count as float
		ref.addItem(DES_Gibber, count, true)
	endif
endfunction

function ConvertDementiaGibber(Form akBaseItem)
	MiscObject coin = akBaseItem as MiscObject
	float valueMult = 1.6
	if(Quest.getQuest("DES_CoinHandler"))
		valueMult = (Quest.GetQuest("DES_CoinHandler") as DES_CoinManager).getCoinValue(coin)
	endif
	if(valueMult > 0.0)
		int count = ref.getItemCount(akBaseItem)
		ref.removeItem(akBaseItem, count, true)
		value += count * valueMult
		count = value as int
		value -= count as float
		ref.addItem(DES_Gibber, count, true)
	endIf
endFunction
