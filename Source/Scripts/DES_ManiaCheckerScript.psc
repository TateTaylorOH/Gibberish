Scriptname DES_ManiaCheckerScript extends activemagiceffect  

Quest Property EC_SS_GibberExchangerQuest auto
MiscObject Property DES_Gibber auto
MiscObject Property DES_GibberFront auto

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
	(EC_SS_GibberExchangerQuest as DES_GibberQuestScript).InMania = 1
	(EC_SS_GibberExchangerQuest as DES_GibberQuestScript).InDementia = 0
	DES_Gibber.SetWorldModelPath("COIN/GibberFront.nif")
	DES_Gibber.SetGoldValue(DES_GibberFront.GetGoldValue())
	;debug.Messagebox("You are in Mania.")
ENDEVENT
