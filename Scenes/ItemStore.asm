Scene_ItemStore:
	tst.w	(Window_routine_3).w
	bne.w	loc_BD92
	lsl.w	#2, d1
	andi.w	#$7C, d1
	jmp	ItemStoreEventIndex-4(pc,d1.w)
; ------------------------------------------
loc_BD92:
	cmpi.w	#1, (Window_routine_3).w
	bne.w	CloseAllWindows
	move.w	#$80D, (Script_queue).w
	addq.w	#1, (Window_routine_3).w
	moveq	#StealItemArray_Item-StealItemArray, d2
	bra.w	ProcessStealItem
; ------------------------------------------
ItemStoreEventIndex:
	bra.w	ItemStore_Enter
	bra.w	ItemStore_Buy_Sell_Prompt
	bra.w	loc_BE1E
	bra.w	loc_BE3C
	bra.w	loc_BE4E
	bra.w	loc_BE8A
	bra.w	loc_BEF6
	bra.w	ItemStore_Confirm_Purchase
	bra.w	loc_BF44
	bra.w	loc_BF56
	bra.w	loc_BF6E
	bra.w	loc_BF7A
	bra.w	loc_BF86
	bra.w	loc_BF92
	bra.w	loc_C014
	bra.w	loc_C026
; ------------------------------------------
ItemStore_Enter:
	move.l	#((WinID_StoreMeseta<<$10)|WinID_ScriptMessage2), (Window_queue).w
	bsr.w	CheckPlanetAndCaps
	beq.s	ItemStore_Greeting
	move.w	#$810, (Script_queue).w
	addq.w	#2, (Window_routine_3).w
	rts

ItemStore_Greeting:
	move.w	#$801, (Script_queue).w		; Welcome. how may I be of service?
	addq.w	#1, (Window_routine_2).w
	rts
ItemStore_Buy_Sell_Prompt:
	move.w	#WinID_BuySell, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_BE1E:
	move.w	($FFFFDEB6).w, d0
	beq.s	loc_BE30
	move.w	#$802, (Script_queue).w		; Whose belongings would you like to sell?
	addq.w	#1, (Window_routine_2).w
	rts

loc_BE30:
	move.w	#$806, (Script_queue).w		; "Which would you like?"
	addq.w	#8, (Window_routine_2).w
	rts

loc_BE3C:
	move.w	#WinID_StoreCharList, (Window_queue).w
	move.w	#$804, (Script_queue).w		; Which do you want to sell?
	addq.w	#1, (Window_routine_2).w
	rts
loc_BE4E:
	tst.w	(Window_routine_4).w
	bne.s	loc_BE70
	move.w	(Character_index).w, d1
	lea	(Character_stats+item_num).w, a0
	lsl.w	#6, d1
	adda.w	d1, a0
	tst.b	(a0)
	bne.s	loc_BE7E
	move.w	#$80F, (Script_queue).w ; $BB, " isn't carrying anything. Is there anyone else who wants to sell something?
	addq.w	#1, (Window_routine_4).w
	rts
loc_BE70:
	move.w	#0, (Window_routine_4).w
	move.w	#WinID_StoreCharList, (Window_index).w
	rts
loc_BE7E:
	move.w	#WinID_MenuItemList, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_BE8A:
	tst.w	(Window_routine_4).w
	bne.s	loc_BEE6
	moveq	#0, d0
	move.b	(Item_index).w, d0
	lsl.w	#4, d0
	lea	(InventoryData+$C).l, a0
	adda.w	d0, a0
	btst	#7, (a0)
	bne.s	loc_BEC0
	move.w	#$805, (Script_queue).w		; "I can't give you a price on something I've never seen before! Try something else!"
	cmpi.b	#ItemID_Teim, (Item_index).w
	bne.s	loc_BEBA
	move.w	#$80E, (Script_queue).w			; "What! You must be joking!"
loc_BEBA:
	addq.w	#1, (Window_routine_4).w
	rts
loc_BEC0:
	move.w	#$803, (Script_queue).w	; Let's say ", $C0, " meseta. How about it?
	moveq	#0, d0
	move.w	-(a0), d0
	lsr.w	#1, d0
	tst.w	(Planet_index).w
	beq.s	loc_BEDC
	cmpi.b	#ItemID_MagicCap, (Character_stats+equipment).w
	bne.s	loc_BEDC
	moveq	#$A, d0
loc_BEDC:
	move.l	d0, (Meseta_value).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_BEE6:
	move.w	#0, (Window_routine_4).w
	addq.w	#1, (Window_routine_2).w
	moveq	#0, d1
	bra.w	Win_Close
loc_BEF6:
	move.w	#WinID_YesNo2, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts

ItemStore_Confirm_Purchase:
	move.w	(Inventory_offset).w, d0
	lsr.w	#3, d0
	andi.w	#1, d0
	addi.w	#$8002, d0
	move.w	d0, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	move.w	(Yes_no_input).w, d0
	beq.s	ItemStore_Complete_Purchase	; if you chose YES, branch
	move.w	#$80B, (Script_queue).w		; "I see. That's too bad. Can I help you with anything else?"
	rts

ItemStore_Complete_Purchase:
	bsr.w	loc_AE2E
	bsr.w	RemoveItemFromInventory
	move.l	(Meseta_value).w, d0
	bsr.w	AddToCurrentMoney
	move.w	#$80C, (Script_queue).w ; Thank you. Is there anything else?
	move.w	#((6<<8)|WinID_StoreMeseta), (Window_queue+2).w
	rts
loc_BF44:
	tst.w	(Script_queue).w
	bne.s	loc_BF54
	move.w	#WinID_YesNo2, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
loc_BF54:
	rts
loc_BF56:
	move.w	(Yes_no_input).w, d0
	bne.s	loc_BF68
	move.w	#WinID_BuySell, (Window_index).w
	subq.w	#7, (Window_routine_2).w
	rts
loc_BF68:
	addq.w	#1, (Window_routine_3).w
	rts
loc_BF6E:
	move.w	#WinID_StoreInventory, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_BF7A:
	move.w	#$808, (Script_queue).w	; Who is going to carry this item?
	addq.w	#1, (Window_routine_2).w
	rts
loc_BF86:
	move.w	#WinID_StoreCharList, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_BF92:
	tst.w	(Window_routine_4).w
	bne.s	loc_C004
	move.w	(Character_index).w, d1
	lea	(Character_stats+item_num).w, a0
	lsl.w	#6, d1
	adda.w	d1, a0
	cmpi.b	#$10, (a0)
	bne.s	loc_BFB6
	move.w	#$809, (Script_queue).w	; You have too much already. Can someone else take it?
	addq.w	#1, (Window_routine_4).w
	rts
loc_BFB6:
	moveq	#0, d0
	move.b	(Item_index).w, d0
	lsl.w	#4, d0
	lea	(InventoryData+$A).l, a0
	adda.w	d0, a0
	moveq	#0, d0
	move.w	(a0), d0
	bsr.w	CheckIfDoublePrice
	move.l	d0, (Meseta_value).w
	bsr.w	CheckSubtractMoney
	beq.s	loc_BFE4
	move.w	#$807, (Script_queue).w ; You don't have enough money.
	addq.w	#1, (Window_routine_3).w
	rts

loc_BFE4:
	move.w	#((6<<8)|WinID_StoreMeseta), (Window_queue).w
	move.w	(Character_index).w, d1
	bsr.w	AddItemToInventory2
	move.b	#SFXID_ItemReceived, (Sound_queue).w
	move.w	#$80A, (Script_queue).w	; Thank you. Will there be anything else?
	addq.w	#1, (Window_routine_2).w
	rts
loc_C004:
	move.w	#0, (Window_routine_4).w
	addq.w	#1, (Window_routine_2).w
	moveq	#0, d1
	bra.w	Win_Close
loc_C014:
	tst.w	(Script_queue).w
	bne.s	+
	move.w	#WinID_YesNo2, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
+
	rts
loc_C026:
	move.w	(Yes_no_input).w, d0
	beq.s	+
	addq.w	#1, (Window_routine_3).w
	rts
+
	move.w	#$8001, (Window_queue).w
	subq.w	#4, (Window_routine_2).w
	move.w	#WinID_StoreInventory, (Window_index).w
	rts