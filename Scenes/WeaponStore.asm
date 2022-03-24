Scene_WeaponStore:
	tst.w	(Window_routine_3).w
	bne.w	loc_BA66
	lsl.w	#2, d1
	andi.w	#$3C, d1
	jmp	WeaponStoreEventIndex-4(pc,d1.w)
; ------------------------------------------
loc_BA66:
	cmpi.w	#1, (Window_routine_3).w
	bne.w	CloseAllWindows
	move.w	#$608, (Script_queue).w
	addq.w	#1, (Window_routine_3).w
	moveq	#StealItemArray_Weapon-StealItemArray, d2
	bra.w	ProcessStealItem
; ------------------------------------------
WeaponStoreEventIndex:
	bra.w	loc_BAA8
	bra.w	loc_BACE
	bra.w	loc_BADA
	bra.w	loc_BAE6
	bra.w	loc_BAF2
	bra.w	loc_BB74
	bra.w	loc_BB80
	bra.w	loc_BBA8
	bra.w	loc_BBB4
	bra.w	loc_BBC6
; ------------------------------------------
loc_BAA8:
	move.l	#((WinID_StoreMeseta<<$10)|WinID_ScriptMessage2), (Window_queue).w
	bsr.w	CheckPlanetAndCaps
	beq.s	loc_BAC2
	move.w	#$810, (Script_queue).w
	addq.w	#2, (Window_routine_3).w
	rts
loc_BAC2:
	move.w	#$601, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BACE:
	move.w	#WinID_StoreInventory, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BADA:
	move.w	#$602, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BAE6:
	move.w	#WinID_StoreCharList, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BAF2:
	move.w	(Character_index).w, d1
	lea	(Character_stats+item_num).w, a0
	lsl.w	#6, d1
	adda.w	d1, a0
	cmpi.b	#$10, (a0)
	bne.s	loc_BB10
	move.w	#$609, (Script_queue).w
	addq.w	#1, (Window_routine_3).w
	rts
loc_BB10:
	moveq	#0, d0
	move.b	(Item_index).w, d0
	lsl.w	#4, d0
	lea	(InventoryData+$D).l, a0
	adda.w	d0, a0
	move.w	(Character_index).w, d0
	btst	d0, (a0)
	bne.s	loc_BB34
	move.w	#$603, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_BB34:
	subq.w	#3, a0
loc_BB36:
	moveq	#0, d0
	move.w	(a0), d0
	bsr.w	CheckIfDoublePrice
	move.l	d0, (Meseta_value).w
	bsr.w	CheckSubtractMoney
	beq.s	loc_BB54
	move.w	#$605, (Script_queue).w
	addq.w	#1, (Window_routine_3).w
	rts
loc_BB54:
	move.w	#((6<<8)|WinID_StoreMeseta), (Window_queue).w
	move.w	(Character_index).w, d1
	bsr.w	AddItemToInventory2
	move.b	#SFXID_ItemReceived, (Sound_queue).w
	move.w	#$607, (Script_queue).w
	addq.w	#4, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BB74:
	move.w	#WinID_YesNo2, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BB80:
	move.w	(Yes_no_input).w, d0
	beq.s	loc_BB92
	move.w	#$604, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_BB92:
	subq.w	#2, (Window_routine_2).w
	moveq	#0, d0
	move.b	(Item_index).w, d0
	lsl.w	#4, d0
	lea	(InventoryData+$A).l, a0
	adda.w	d0, a0
	bra.s	loc_BB36
; ------------------------------------------
loc_BBA8:
	move.w	#WinID_StoreCharList, (Window_index).w
	subq.w	#3, (Window_routine_2).w
	rts
; ------------------------------------------
loc_BBB4:
	tst.w	(Script_queue).w
	bne.s	loc_BBC4
	move.w	#WinID_YesNo2, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
loc_BBC4:
	rts
; ------------------------------------------
loc_BBC6:
	move.w	(Yes_no_input).w, d0
	beq.s	loc_BBD8
	move.w	#$606, (Script_queue).w
	addq.w	#1, (Window_routine_3).w
	rts
loc_BBD8:
	move.w	#$8001, (Window_queue).w
	subq.w	#7, (Window_routine_2).w
	move.w	#WinID_StoreInventory, (Window_index).w
	rts
; ------------------------------------------