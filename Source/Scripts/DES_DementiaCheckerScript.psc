Scriptname DES_DementiaCheckerScript extends activemagiceffect  

Quest Property EC_SS_GibberExchangerQuest auto
MiscObject Property DES_Gibber auto

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
	(EC_SS_GibberExchangerQuest as DES_GibberQuestScript).InMania = 0
	(EC_SS_GibberExchangerQuest as DES_GibberQuestScript).InDementia = 1
	DES_Gibber.SetWorldModelPath("COIN/GibberBack.nif")
ENDEVENT