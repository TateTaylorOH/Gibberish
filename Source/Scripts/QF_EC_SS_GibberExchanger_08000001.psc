;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_EC_SS_GibberExchanger_08000001 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Alias_Player as DES_GibberTracker).GoToState("Waiting")
Alias_Player.RemoveAllInventoryEventFilters()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Alias_Player as DES_GibberTracker).GoToState("WaitingOnGibber")
Alias_Player.AddInventoryEventFilter(DES_Gibber)
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(Alias_Player as DES_GibberTracker).GoToState("Waiting")
Alias_Player.RemoveAllInventoryEventFilters()
SetObjectiveCompleted(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property DES_Gibber  Auto  
