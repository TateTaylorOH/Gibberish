Scriptname DES_NullCheckerScript extends activemagiceffect  

Quest Property EC_SS_GibberExchangerQuest auto

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
	(EC_SS_GibberExchangerQuest as DES_GibberQuestScript).InMania = 0
	(EC_SS_GibberExchangerQuest as DES_GibberQuestScript).InDementia = 0
ENDEVENT

