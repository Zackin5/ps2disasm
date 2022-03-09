	dc.b	loc_19453-Script_DataMemory	; 1
	dc.b	loc_1946B-loc_19453			; 2
	dc.b	loc_1948E-loc_1946B			; 3
	dc.b	loc_194CD-loc_1948E			; 4
	dc.b	loc_194EF-loc_194CD			; 5
	dc.b	loc_19516-loc_194EF			; 6
	dc.b	loc_1955A-loc_19516			; 7
	dc.b	loc_19575-loc_1955A			; 8
	dc.b	loc_19599-loc_19575			; 9
	dc.b	loc_195D8-loc_19599			; $A
	dc.b	loc_195EC-loc_195D8			; $B
	dc.b	loc_195FE-loc_195EC			; $C
	dc.b	loc_19614-loc_195FE			; $D

loc_19453:
	dc.b	"Welcome to Data Memory."
	dc.b	$C4

loc_1946B:
	dc.b	$BB, " needs ", $C0, " points"
	dc.b	$C1
	dc.b	"to go up a level."
	dc.b	$C4

loc_1948E:
	dc.b	"Do you want to put your"
	dc.b	$C1
	dc.b	"memories and experiences"
	dc.b	$C3
	dc.b	"into storage?"
	dc.b	$C5

loc_194CD:
	dc.b	"I see; well, be on your"
	dc.b	$C1
	dc.b	"way then."
	dc.b	$C4

loc_194EF:
	dc.b	"What number should we"
	dc.b	$C1
	dc.b	"save them under?"
	dc.b	$C5

loc_19516:
	dc.b	"We already have data"
	dc.b	$C1
	dc.b	"saved under that number."
	dc.b	$C3
	dc.b	"Is it OK to erase it?"
	dc.b	$C5

loc_1955A:
	dc.b	"Enter a name for the"
	dc.b	$C1
	dc.b	"file."
	dc.b	$C5

loc_19575:
	dc.b	"All memories and"
	dc.b	$C1
	dc.b	"experiences saved."
	dc.b	$C4

loc_19599:
	dc.b	"Are you going to "
	dc.b	$C1
	dc.b	"adventure some more?"

; the following lines don't make much sense here, because they are called right after the question, before the player gets to answer!
; Remove the following lines until the C5 (KEEP THE C5), if you don't want it.
	;dc.b	$C1
	;dc.b	"I see. Well, good luck!"
	dc.b	$C5

loc_195D8:
	;dc.b	"Ok, good-bye, then."
	dc.b	"I see. Well, good luck!"
	dc.b	$C4

loc_195EC:
	dc.b	"We meet again, ", $BB, "."
	dc.b	$C4

loc_195FE:
	dc.b	"Be careful out there!"
	dc.b	$C4

loc_19614:
	dc.b	$BB, " it is not possible"
	dc.b	$C1
	dc.b	"for you to gain any more"
	dc.b	$C3
	dc.b	"levels!"
	dc.b	$C4