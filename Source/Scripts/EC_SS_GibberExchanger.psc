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
	Initialize()
endEvent

Event OnPlayerLoadGame()
	Initialize()
endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akBaseItem == DES_GibberBack
		ConvertDementiaGibber(akBaseItem)
	elseif akBaseItem == DES_GibberFront
		ConvertManiaGibber(akBaseItem)
	endIf
EndEvent

Event OnMenuOpen(String MenuName)
	IF (getOwningQuest() as DES_GibberQuestScript).InMania == 0 && (getOwningQuest() as DES_GibberQuestScript).InDementia == 0
		IF MenuName == "TweenMenu"
			IF defaultPath == true
				DES_Gibber.SetWorldModelPath("COIN/GibberBack.nif")
				DES_Gibber.SetGoldValue(DES_GibberBack.GetGoldValue())
				defaultPath = false
			ELSEIF defaultPath == false
				DES_Gibber.SetWorldModelPath("COIN/GibberFront.nif")
				DES_Gibber.SetGoldValue(DES_GibberFront.GetGoldValue())
				defaultPath = true
			ENDIF
		ENDIF
	ENDIF
EndEvent

function ConvertDementiaGibber(Form akBaseItem)
	MiscObject coin = akBaseItem as MiscObject
	int count = PlayerRef.getItemCount(akBaseItem)
	PlayerRef.removeItem(akBaseItem, count, true)
	PlayerRef.addItem(DES_Gibber, count, true)
	DES_Gibber.SetGoldValue(akBaseItem.GetGoldValue())
endfunction

function ConvertManiaGibber(Form akBaseItem)
	MiscObject coin = akBaseItem as MiscObject
	int count = PlayerRef.getItemCount(akBaseItem)
	PlayerRef.removeItem(akBaseItem, count, true)
	PlayerRef.addItem(DES_Gibber, count, true)
	DES_Gibber.SetGoldValue(akBaseItem.GetGoldValue())
endFunction

function Initialize()
	IF EC_SS_GoldChanceNone.getValue() != 100
		EC_SS_GoldChanceNone.setValue(100.0)
	ENDIF
	IF EC_SS_GibberChanceNone.getValue() != 0
		EC_SS_GibberChanceNone.setValue(0.0)
	ENDIF
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
	IF (getOwningQuest() as DES_GibberQuestScript).InDementia == 1
		DES_Gibber.SetWorldModelPath("COIN/GibberBack.nif")
		DES_Gibber.SetGoldValue(DES_GibberBack.GetGoldValue())
	ELSEIF (getOwningQuest() as DES_GibberQuestScript).InMania == 1
		DES_Gibber.SetWorldModelPath("COIN/GibberFront.nif")
		DES_Gibber.SetGoldValue(DES_GibberFront.GetGoldValue())
	ENDIF
	IF (Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).GibberFrontValue != 1.61803
		Utility.Wait(5)
		(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).GibberFrontValue = 1.61803
	ENDIF
	IF (Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).GibberBackValue != 0.99965
		Utility.Wait(5)
		(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).GibberBackValue = 0.99965
	ENDIF
endFunction