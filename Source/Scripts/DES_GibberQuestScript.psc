Scriptname DES_GibberQuestScript extends Quest  

import SEA_BarterFunctions

miscobject property des_gibber auto
actor property playerref auto

Event OnCustomBarterMenu(Actor a_kSeller)
	If GetCurrency() == DES_gibber
		IF !getStageDone(11) && !getstagedone(10) && PlayerRef.GetItemCount(DES_gibber) == 0
			setstage(5)
		elseif PlayerRef.GetItemCount(DES_gibber) > 0
			setstage(11)
		ENDIF
	Endif
endEvent