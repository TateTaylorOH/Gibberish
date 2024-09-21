Scriptname DES_GibberTracker extends ReferenceAlias  

miscobject property DES_gibber auto

import SEA_BarterFunctions

Event OnPlayerGameLoad()
	SEA_BarterFunctions.RegisterFormForAllEvents(getowningquest())
endevent

event OnInit()
	SEA_BarterFunctions.RegisterFormForAllEvents(getowningquest())
endEvent

auto state Waiting
endState

state WaitingOnGibber

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akBaseItem == DES_gibber
		getOwningQuest().SetStage(10)
	endif
endevent

endState