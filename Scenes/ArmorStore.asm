
Scene_ArmorStore:
	tst.w	(Window_routine_3).w
	bne.w	loc_BBFC
	lsl.w	#2, d1
	andi.w	#$3C, d1
	jmp	ArmorStoreEventIndex-4(pc,d1.w)
; ------------------------------------------
loc_BBFC:
	cmpi.w	#1, (Window_routine_3).w
	bne.w	CloseAllWindows
	move.w	#$708, (Script_queue).w
	addq.w	#1, (Window_routine_3).w
	moveq	#StealItemArray_Armor-StealItemArray, d2
	bra.w	ProcessStealItem
; ------------------------------------------
ArmorStoreEventIndex:
	bra.w	loc_BC3E
	bra.w	loc_BC64
	bra.w	loc_BC70
	bra.w	loc_BC7C
	bra.w	loc_BC88
	bra.w	loc_BD0A
	bra.w	loc_BD16
	bra.w	loc_BD3E
	bra.w	loc_BD4A
	bra.w	loc_BD5C
; ------------------------------------------
loc_BC3E:
	move.l	#((WinID_StoreMeseta<<$10)|WinID_ScriptMessage2), (Window_queue).w
	bsr.w	CheckPlanetAndCaps
	beq.s	loc_BC58
	move.w	#$810, (Script_queue).w
	addq.w	#2, (Window_routine_3).w
	rts
loc_BC58:
	move.w	#$701, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BC64:
	move.w	#WinID_StoreInventory, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BC70:
	move.w	#$702, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BC7C:
	move.w	#WinID_StoreCharList, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BC88:
	move.w	(Character_index).w, d1
	lea	(Character_stats+item_num).w, a0
	lsl.w	#6, d1
	adda.w	d1, a0
	cmpi.b	#$10, (a0)
	bne.s	loc_BCA6
	move.w	#$709, (Script_queue).w
	addq.w	#1, (Window_routine_3).w
	rts
loc_BCA6:
	moveq	#0, d0
	move.b	(Item_index).w, d0
	lsl.w	#4, d0
	lea	(InventoryData+$D).l, a0
	adda.w	d0, a0
	move.w	(Character_index).w, d0
	btst	d0, (a0)
	bne.s	loc_BCCA
	move.w	#$703, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_BCCA:
	subq.w	#3, a0
loc_BCCC:
	moveq	#0, d0
	move.w	(a0), d0
	bsr.w	CheckIfDoublePrice
	move.l	d0, (Meseta_value).w
	bsr.w	CheckSubtractMoney
	beq.s	loc_BCEA
	move.w	#$705, (Script_queue).w
	addq.w	#1, (Window_routine_3).w
	rts
loc_BCEA:
	move.w	#((6<<8)|WinID_StoreMeseta), (Window_queue).w
	move.w	(Character_index).w, d1
	bsr.w	AddItemToInventory2
	move.b	#SFXID_ItemReceived, (Sound_queue).w
	move.w	#$707, (Script_queue).w
	addq.w	#4, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BD0A:
	move.w	#WinID_YesNo2, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BD16:
	move.w	(Yes_no_input).w, d0
	beq.s	loc_BD28
	move.w	#$704, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_BD28:
	subq.w	#2, (Window_routine_2).w
	moveq	#0, d0
	move.b	(Item_index).w, d0
	lsl.w	#4, d0
	lea	(InventoryData+$A).l, a0
	adda.w	d0, a0
	bra.s	loc_BCCC
; ------------------------------------------
loc_BD3E:
	move.w	#WinID_StoreCharList, (Window_index).w
	subq.w	#3, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BD4A:
	tst.w	(Script_queue).w
	bne.s	loc_BD5A
	move.w	#WinID_YesNo2, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
loc_BD5A:
	rts
; ------------------------------------------
loc_BD5C:
	move.w	(Yes_no_input).w, d0
	beq.s	loc_BD6E
	move.w	#$706, (Script_queue).w
	addq.w	#1, (Window_routine_3).w
	rts
loc_BD6E:
	move.w	#$8001, (Window_queue).w
	subq.w	#7, (Window_routine_2).w
	move.w	#WinID_StoreInventory, (Window_index).w
	rts
; ------------------------------------------