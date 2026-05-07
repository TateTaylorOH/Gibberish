Scriptname DES_NullCheckerScript extends activemagiceffect  

Quest Property EC_SS_GibberExchangerQuest auto

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
	(EC_SS_GibberExchangerQuest as DES_GibberCurrencySwapper).InMania = 0
	(EC_SS_GibberExchangerQuest as DES_GibberCurrencySwapper).InDementia = 0
ENDEVENT

