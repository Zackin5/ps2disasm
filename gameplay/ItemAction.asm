; -------------------------------------------
ItemActionEntries:
	bra.w	ItemAction_UseEntry
	bra.w	ItemAction_GiveEntry
	bra.w	ItemAction_TossEntry
; -------------------------------------------

ItemAction_UseEntry:
	move.w	(Window_routine_3).w, d1
	bne.s	+
	move.w	#WinID_ScriptMessage, (Window_queue).w
	addq.w	#1, (Window_routine_3).w
+
	lea	(Character_stats+curr_hp).w, a2		; character's current HP
	move.w	(Character_index).w, d0
	lsl.w	#6, d0
	adda.w	d0, a2		; get selected character
	tst.w	(a2)
	bne.s	++				; branch if character is not dead
	cmpi.w	#1, (Window_routine_3).w
	bne.s	+
	move.w	#6, (Script_queue).w
	addq.w	#1, (Window_routine_3).w
	rts

+
	subq.w	#1, (Window_routine_3).w
	bra.w	Win_CloseCurrent

+
	moveq	#0, d0
	move.b	(Item_index).w, d0
	move.w	d0, d2
	lsl.w	#4, d2
	lea	(InventoryData+$C).l, a0		; determine kind of item
	adda.w	d2, a0
	btst	#3, (a0)
	beq.s	ItemAction_NoAction		; if the bit is not set, do nothing for this item
	cmpi.w	#ItemID_NeiSword, d0
	beq.w	NeiSword_ItemSelected
	cmpi.w	#ItemID_Teim, d0
	beq.w	Teim_ItemSelected
	cmpi.w	#ItemID_Visiphone, d0
	beq.w	Visiphone_ItemSelected

	lsl.w	#2, d0
	andi.w	#$1FC, d0
	jmp	UsedItemActionIndex(pc,d0.w)

; -------------------------------------------
UsedItemActionIndex:
	bra.w	ItemAction_NoAction
	bra.w	ItemAction_SmallKey
	bra.w	ItemAction_Dynamite
	bra.w	ItemAction_KeyTube
	bra.w	ItemAction_MruraGum
	bra.w	ItemAction_GreenCard
	bra.w	ItemAction_BlueCard
	bra.w	ItemAction_YellowCard
	bra.w	ItemAction_RedCard
	bra.w	ItemAction_Letter
	bra.w	ItemAction_Recorder
	bra.w	ItemAction_MruraLeaf
	bra.w	ItemAction_PlsmRing
	bra.w	ItemAction_Prism
	bra.w	ItemAction_Telepipe
	bra.w	ItemAction_Escapipe
	bra.w	ItemAction_Hidapipe
	bra.w	ItemAction_Monomate
	bra.w	ItemAction_Monomate
	bra.w	ItemAction_Monomate
	bra.w	ItemAction_Antidote
	bra.w	ItemAction_StarMist
	bra.w	ItemAction_MoonDew
; -------------------------------------------
ItemAction_NoAction:
	tst.w	d1
	bne.s	+
	move.w	#1, (Script_queue).w		; "'Character' uses 'Item'...."
	rts

+
	subq.w	#1, d1
	bne.w	ItemAction_CloseMenu
	move.w	#4, (Script_queue).w		; "Nothing happens."
	addq.w	#1, (Window_routine_3).w	; Increment text tile
	rts

; -------------------------------------------
ItemAction_SmallKey:
	tst.w	d1
	bne.s	loc_9BEC
	bsr.w	CheckItemInteract
	beq.s	loc_9BE0	; we didn't interact with anything (next to no object) so display item description
	cmpi.b	#2, $2E(a1)
	bne.s	loc_9BE0
	moveq	#0, d1
	move.b	$2F(a1), d1
	lea	(Treasure_chest_flags).w, a1
	adda.w	d1, a1
	bclr	#7, (a1)					; mark chest as unlocked
	beq.s	loc_9BE0					; if it's already unlocked, branch
	move.w	#1, (Script_queue).w		; "'Character' uses 'Item'...."
	rts

loc_9BE0:
	move.w	#$15, (Script_queue).w		; "It is a key for a small container."
	addq.w	#1, (Window_routine_3).w
	rts

loc_9BEC:
	subq.w	#1, d1
	bne.w	CloseAllWindows
	move.w	#$17, (Script_queue).w		; "The container opens."
	addq.w	#1, (Window_routine_3).w
	rts


; -----------------------------------------------------------------
CheckItemInteract:
	lea	(Characters_RAM).w, a0
	move.w	facing_dir(a0), d6
	beq.s	+
	divu.w	#3, d6
+
	bsr.w	Map_ChkTargetInteract
	rts
; -----------------------------------------------------------------


; -----------------------------------------------------------------
; Returns
;
; d1 = event flag offset; 0 if item is not found
; a1 = event flag address
; -----------------------------------------------------------------
GetItemEventFlag:
	bsr.w	CheckItemInteract
	beq.s	+
	tst.b	type(a1)
	bne.s	+
	moveq	#0, d1
	move.b	subtype(a1), d1
	lea	(Event_flags).w, a1
	adda.w	d1, a1
	rts
+
	moveq	#0, d1
	rts
; -----------------------------------------------------------------


; -----------------------------------------------------------------
ItemAction_Dynamite:
	tst.w	d1
	bne.w	CloseAllWindows
	bsr.s	GetItemEventFlag
	beq.s	.nouse
	cmpi.b	#$18, d1
	beq.s	.use
	cmpi.b	#$19, d1
	beq.s	.use
	cmpi.b	#$1A, d1
	bne.s	.nouse
.use:
	bset	#0, (a1)
	bne.s	.nouse
	move.w	#1, (Script_queue).w		; "'Character' uses 'Item'...."
	move.w	#1, (Cutscene_flag).w
	move.w	#4, (Cutscene_index).w
	move.w	#0, (Cutscene_input_frame).w
	bra.w	RemoveItemFromInventory

.nouse:
	move.w	#$14, (Script_queue).w		; "'Character' takes out 'Item' and puts it back."
	jmp ItemAction_CloseMenu
	;rts
; -----------------------------------------------------------------


; -----------------------------------------------------------------
ItemAction_KeyTube:
	tst.w	d1
	bne.w	CloseAllWindows
	bsr.w	GetItemEventFlag
	beq.s	.nouse
	cmpi.b	#$1B, d1
	bne.s	.nouse
	bset	#0, (a1)
	bne.s	.nouse
	move.w	#$18, (Script_queue).w		; "'Character' puts 'Item' inside."
	move.w	#1, (Cutscene_flag).w
	move.w	#5, (Cutscene_index).w
	move.w	#0, (Cutscene_input_frame).w
	bra.w	RemoveItemFromInventory

.nouse:
	move.w	#$16, (Script_queue).w		; "It is a metal pole, 20cm long,with markings."
	rts
; -----------------------------------------------------------------

ItemAction_MruraGum:
	tst.w	d1
	bne.s	loc_9CD6
	bsr.w	GetItemEventFlag
	beq.s	loc_9CCA
	cmpi.b	#$F, d1
	bne.s	loc_9CCA
	move.w	#$19, (Script_queue).w		; "The party eats 'Item'. With each bite, everyone's mouth fills with air! Could help underwater.."
	rts
loc_9CCA:
	move.w	#$1A, (Script_queue).w		; "The ocean bottom would be a good testing place."
	addq.w	#1, (Window_routine_3).w
	rts
loc_9CD6:
	subq.w	#1, d1
	bne.w	CloseAllWindows
	move.w	#MapID_UnderwaterPassage, (Map_index).w
	move.w	#$170, (Map_Y_pos).w
	move.w	#$700, (Map_X_pos).w
	move.w	#MapID_MotaOverworld, ($FFFFC64C).w
	move.w	($FFFFE80E).w, d0
	andi.w	#$FFF0, d0
	move.w	d0, ($FFFFC64E).w
	move.w	($FFFFE80A).w, d0
	andi.w	#$FFF0, d0
	move.w	d0, ($FFFFC650).w
	move.w	#-1, (Screen_changed_flag).w
	addq.w	#1, (Window_routine_3).w
	rts
; -------------------------------------------
ItemAction_GreenCard:
	moveq	#$1C, d0
	move.w	#$1C, (Script_queue).w		; "It's a card which shines like a green emerald!"
	bra.s	ItemAction_Cards
; -------------------------------------------
ItemAction_BlueCard:
	moveq	#$1E, d0
	move.w	#$1D, (Script_queue).w		; "It's a card which is a bluish aquamarine color."
	bra.s	ItemAction_Cards
; -------------------------------------------
ItemAction_YellowCard:
	moveq	#$20, d0
	move.w	#$1E, (Script_queue).w		; "It's a yellow card, like the sands of Mota."
	bra.s	ItemAction_Cards
; -------------------------------------------
ItemAction_RedCard:
	moveq	#$22, d0
	move.w	#$1F, (Script_queue).w		; "It's a card which is red like the setting sun."

ItemAction_Cards:
	tst.w	d1
	bne.s	loc_9D92
	bsr.w	GetItemEventFlag
	beq.s	loc_9D6A
	cmp.b	d0, d1
	bne.s	loc_9D70
	bset	#0, (a1)
	bne.s	loc_9D70
	move.w	#$18, (Script_queue).w		; "'Character' puts 'Item' inside."
	move.w	#1, (Cutscene_flag).w
	move.w	#5, (Cutscene_index).w
	move.w	#0, (Cutscene_input_frame).w
loc_9D6A:
	addq.w	#1, (Window_routine_3).w
	rts
loc_9D70:
	addq.w	#1, d0
	cmp.b	d0, d1
	bne.s	loc_9D6A
	bset	#0, (a1)
	bne.s	loc_9D6A
	moveq	#0, d0
	move.b	(Item_index).w, d0
	move.w	#8, (Map_event_load).w
	move.w	#$18, (Script_queue).w		; "'Character' puts 'Item' inside."
	bra.w	RemoveItemFromInventory
loc_9D92:
	move.w	#0, (Script_queue).w
	subq.w	#1, d1
	bne.w	CloseAllWindows
	move.w	#$1B, (Script_queue).w		; "The dam locks open, and rushing water is heard."
	move.b	#SFXID_DamOpened, (Sound_queue).w
	addq.w	#1, (Window_routine_3).w
	rts
; -------------------------------------------
ItemAction_Letter:
	tst.w	d1
	bne.w	ItemAction_CloseMenu
	move.w	#$20, (Script_queue).w		; "The note said: 'Darum! I have your daughter Teim locked in Nido tower. Pay 50,000 meseta in one month if you ever want to see her again,' To get the money, Darum turned to crime."
	rts
; -------------------------------------------
ItemAction_Recorder:
	tst.w	d1
	bne.w	ItemAction_CloseMenu
	move.l	#$210022, (Script_queue).w		; "This device records all events in the Biosystems lab."
												; "If this can be delivered to Paseo, we will know what caused the Biohazards."
	rts
; -------------------------------------------
ItemAction_MruraLeaf:
	tst.w	d1
	bne.w	ItemAction_CloseMenu
	move.w	#$11, (Script_queue).w		; "This is a leaf from a Maruera tree. It's soft."
	rts
; -------------------------------------------
ItemAction_PlsmRing:
	tst.w	d1
	bne.w	ItemAction_CloseMenu
	move.w	#$F, (Script_queue).w		; "'Character can't let go of the item!'"
	rts
; -------------------------------------------
ItemAction_Prism:
	tst.w	d1
	bne.w	ItemAction_CloseMenu
	move.w	#7, (Script_queue).w			; "The prism shines with a strange brilliance."
	rts
; -------------------------------------------
ItemAction_Telepipe:
	tst.w	d1
	bne.s	loc_9E18
	move.w	#$12, (Script_queue).w		; "Character's body feels very light."
	move.w	(Map_index).w, d0
	cmpi.w	#MapID_DezolisSkure, d0
	bls.s	+						; We can use this item only on Motavia and Dezolis (in Skure as well) world map
	move.w	#$27, (Script_queue).w		; "That can't be used here."
	addq.w	#1, (Window_routine_3).w
+
	rts

loc_9E18:
	subq.w	#1, d1
	bne.w	CloseAllWindows
	tst.w	(Planet_index).w
	bne.s	loc_9E56
	move.w	#MapID_Paseo, (Map_index).w
	move.w	#$100, (Map_Y_pos).w
	move.w	#$1F0, (Map_X_pos).w
	tst.w	($FFFFC65A).w
	bne.s	loc_9E98
	move.w	#MapID_Paseo, (Map_index).w
	move.w	#$80, (Map_Y_pos).w
	move.w	#$110, (Map_X_pos).w
	tst.w	($FFFFC65C).w
	bne.s	loc_9E98
	bra.s	loc_9E86
loc_9E56:
	move.w	#MapID_DezolisSkure, (Map_index).w
	move.w	#$4F0, (Map_Y_pos).w
	move.w	#$3C0, (Map_X_pos).w
	tst.w	($FFFFC65A).w
	beq.s	loc_9E98
	move.w	#MapID_Aukba, (Map_index).w
	move.w	#$60, (Map_Y_pos).w
	move.w	#$70, (Map_X_pos).w
	tst.w	($FFFFC65C).w
	bne.s	loc_9E98
loc_9E86:
	move.w	($FFFFC646).w, (Map_index).w
	move.w	($FFFFC648).w, (Map_Y_pos).w
	move.w	($FFFFC64A).w, (Map_X_pos).w
loc_9E98:
	move.w	#0, (Jet_Scooter_flag).w
	move.w	#-1, (Screen_changed_flag).w
	addq.w	#1, (Window_routine_3).w
	move.b	#SFXID_Teleport, (Sound_queue).w
	tst.w	($FFFFDE80).w
	bne.w	Map_TechEffect_SubtractTP
	bra.w	RemoveItemFromInventory
; -------------------------------------------
ItemAction_Escapipe:
	tst.w	d1
	bne.s	loc_9ED8
	move.w	#$12, (Script_queue).w		; "Character's body feels very light."
	cmpi.w	#MapID_EsperMansionB1, (Map_index).w
	bcc.s	loc_9ED6
	move.w	#$27, (Script_queue).w		; "That can't be used here."
	addq.w	#1, (Window_routine_3).w
loc_9ED6:
	rts
loc_9ED8:
	subq.w	#1, d1
	bne.w	CloseAllWindows
	move.w	($FFFFC64C).w, (Map_index).w
	move.w	($FFFFC64E).w, (Map_Y_pos).w
	move.w	($FFFFC650).w, (Map_X_pos).w
	move.w	#-1, (Screen_changed_flag).w
	addq.w	#1, (Window_routine_3).w
	move.b	#SFXID_Teleport, (Sound_queue).w
	tst.w	($FFFFDE80).w
	bne.w	Map_TechEffect_SubtractTP
	bra.w	RemoveItemFromInventory
; -------------------------------------------
ItemAction_Hidapipe:
	tst.w	d1
	bne.s	loc_9F2E
	move.w	#$13, (Script_queue).w
	move.w	(Map_index).w, d0
	beq.s	loc_9F2C
	cmpi.w	#MapID_DezolisSkure, d0
	beq.s	loc_9F2C
	move.w	#$27, (Script_queue).w		; "That can't be used here."
	addq.w	#1, (Window_routine_3).w
loc_9F2C:
	rts
loc_9F2E:
	subq.w	#1, d1
	bne.w	CloseAllWindows
	move.b	#SFXID_Hidapipe, (Sound_queue).w
	move.b	#0, (Track_timer).w
-
	cmpi.b	#$80, (Track_timer).w
	bne.s	-
	move.w	#$FFFF, (Encounter_rate_decreased_flag).w
	addq.w	#1, (Window_routine_3).w
	bra.w	RemoveItemFromInventory
; -------------------------------------------
ItemAction_Monomate:
	tst.w	d1
	bne.s	loc_9F62
	move.w	#WinID_ChosenItemChar, (Window_queue).w
	rts

loc_9F62:
	subq.w	#1, d1
	bne.s	loc_9F92
	move.w	#WinID_ScriptMessage, (Window_queue).w
	lea	(Character_stats+curr_hp).w, a2
	move.w	(Character_index_2).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.w	#1, (Script_queue).w		; "'Character' uses 'Item'...."
	tst.w	(a2)
	bne.s	loc_9F8C
	move.w	#$102, (Script_queue).w
	subq.w	#1, (Window_routine_3).w
loc_9F8C:
	addq.w	#2, (Window_routine_3).w
	rts

loc_9F92:
	subq.w	#1, d1
	beq.w	Win_CloseCurrent
	subq.w	#1, d1
	bne.s	loc_9FC4
	lea	(Character_stats).w, a2
	move.w	(Character_index_2).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.w	#2, (Script_queue).w
	tst.w	(a2)
	bpl.s	loc_9FBC
	move.w	#$10C, (Script_queue).w
	addq.w	#3, (Window_routine_3).w
loc_9FBC:
	addq.w	#1, (Window_routine_3).w
	bra.w	RemoveItemFromInventory

loc_9FC4:
	subq.w	#1, d1
	bne.s	loc_9FDA
	move.w	#WinID_MenuCharStats, (Window_queue).w
	move.w	#$1E, ($FFFFDE5E).w
	addq.w	#1, (Window_routine_3).w
	rts

loc_9FDA:
	subq.w	#1, d1
	bne.s	loc_A02A
	subq.w	#1, ($FFFFDE5E).w
	bpl.s	loc_A028
	lea	(Character_stats+curr_hp).w, a2
	move.w	(Character_index_2).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.w	(a2)+, d1					; get character's HP
	move.b	(Item_index).w, d0
	cmpi.b	#ItemID_Monomate, d0
	bne.s	UsedItem_CheckDimate			; branch if we're not using a Monomate
	addi.w	#$14, d1				; heal character 20 HP
	bra.s	UsedItem_Heal

UsedItem_CheckDimate:
	cmpi.b	#ItemID_Dimate, d0
	bne.s	UsedItem_HealFull			;  branch if we're not using a Dimate
	addi.w	#$3C, d1				; heal character 60 HP
	bra.s	UsedItem_Heal

UsedItem_HealFull:
	move.w	(a2), d1		; get Max HP value to be used for complete recovery

UsedItem_Heal:
	cmp.w	(a2), d1
	bcs.s	loc_A016	; branch if the sum of current HP and healing value is lower than max HP
	move.w	(a2), d1		; if same or higher than max HP, just get max HP directly

loc_A016:
	move.w	d1, -(a2)		; finally, move the new value into current HP
	move.w	#((6<<8)|WinID_MenuCharStats), (Window_queue).w
	addq.w	#1, (Window_routine_3).w
	move.b	#SFXID_Healed, (Sound_queue).w
loc_A028:
	rts

loc_A02A:
	subq.w	#1, d1
	bne.s	loc_A032
	bsr.w	WaitJoypad_B_C_Pressed
loc_A032:
	bne.w	ItemAction_CloseMenu
	rts
; -------------------------------------------
ItemAction_Antidote:
	tst.w	d1
	bne.s	loc_A044
	move.w	#WinID_ChosenItemChar, (Window_queue).w
	rts
loc_A044:
	subq.w	#1, d1
	bne.s	loc_A074
	move.w	#WinID_ScriptMessage, (Window_queue).w
	lea	(Character_stats+curr_hp).w, a2
	move.w	(Character_index_2).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.w	#1, (Script_queue).w		; "'Character' uses 'Item'...."
	tst.w	(a2)
	bne.s	loc_A06E
	move.w	#$102, (Script_queue).w
	subq.w	#1, (Window_routine_3).w
loc_A06E:
	addq.w	#2, (Window_routine_3).w
	rts
loc_A074:
	subq.w	#1, d1
	beq.w	Win_CloseCurrent
	subq.w	#1, d1
	bne.s	loc_A0A6
	lea	(Character_stats).w, a2
	move.w	(Character_index_2).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.w	#3, (Script_queue).w
	tst.w	(a2)
	bmi.s	loc_A09E
	move.w	#4, (Script_queue).w		; "Nothing happens."
	addq.w	#3, (Window_routine_3).w
loc_A09E:
	addq.w	#1, (Window_routine_3).w
	bra.w	RemoveItemFromInventory
loc_A0A6:
	subq.w	#1, d1
	bne.s	loc_A0BC
	move.w	#WinID_MenuCharStats, (Window_queue).w
	move.w	#$1E, ($FFFFDE5E).w
	addq.w	#1, (Window_routine_3).w
	rts
loc_A0BC:
	subq.w	#1, d1
	bne.s	loc_A0E8
	subq.w	#1, ($FFFFDE5E).w
	bpl.s	loc_A0E6
	lea	(Character_stats).w, a2
	move.w	(Character_index_2).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.w	#0, (a2)
	move.w	#((6<<8)|WinID_MenuCharStats), (Window_queue).w
	addq.w	#1, (Window_routine_3).w
	move.b	#SFXID_PoisonCured, (Sound_queue).w
loc_A0E6:
	rts
loc_A0E8:
	subq.w	#1, d1
	bne.s	loc_A0F0
	bsr.w	WaitJoypad_B_C_Pressed
loc_A0F0:
	bne.w	ItemAction_CloseMenu
	rts
; -------------------------------------------
ItemAction_StarMist:
	tst.w	d1
	bne.s	loc_A104
	move.l	#$10010, (Script_queue).w
	rts
loc_A104:
	subq.w	#1, d1
	bne.s	loc_A11E
	bsr.w	RemoveItemFromInventory
	move.w	#WinID_MenuCharStats, (Window_queue).w
	move.w	#$1E, ($FFFFDE5E).w
	addq.w	#1, (Window_routine_3).w
	rts
loc_A11E:
	subq.w	#1, d1
	bne.s	loc_A15A
	subq.w	#1, ($FFFFDE5E).w
	bpl.s	loc_A158
	lea	(Party_member_ID).w, a1
	move.w	(Party_members_num).w, d0
loc_A130:
	lea	(Character_stats).w, a2
	move.w	(a1)+, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	tst.w	(a2)+
	bmi.s	loc_A144
	tst.w	(a2)+
	beq.s	loc_A144
	move.w	(a2), -(a2)
loc_A144:
	dbf	d0, loc_A130
	move.w	#((6<<8)|WinID_MenuCharStats), (Window_queue).w
	addq.w	#1, (Window_routine_3).w
	move.b	#SFXID_Healed, (Sound_queue).w
loc_A158:
	rts
loc_A15A:
	bsr.w	WaitJoypad_B_C_Pressed
	bne.w	ItemAction_CloseMenu
	rts
; -------------------------------------------
ItemAction_MoonDew:
	tst.w	d1
	bne.s	loc_A170
	move.w	#WinID_ChosenItemChar, (Window_queue).w
	rts
loc_A170:
	subq.w	#1, d1
	bne.s	loc_A188
	move.w	#WinID_ScriptMessage, (Window_queue).w
	move.l	#$10010, (Script_queue).w
	addq.w	#1, (Window_routine_3).w
	rts
loc_A188:
	subq.w	#1, d1
	bne.s	loc_A1B2
	bsr.w	RemoveItemFromInventory
	lea	(Character_stats+curr_hp).w, a2
	move.w	(Character_index_2).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.w	#5, (Script_queue).w
	tst.w	(a2)
	beq.s	loc_A1AC
	move.w	#2, (Script_queue).w
loc_A1AC:
	addq.w	#1, (Window_routine_3).w
	rts
loc_A1B2:
	subq.w	#1, d1
	bne.s	loc_A1C8
	move.w	#WinID_MenuCharStats, (Window_queue).w
	move.w	#$1E, ($FFFFDE5E).w
	addq.w	#1, (Window_routine_3).w
	rts
loc_A1C8:
	subq.w	#1, d1
	bne.s	loc_A1F2
	subq.w	#1, ($FFFFDE5E).w
	bpl.s	loc_A1F0
	move.w	#((6<<8)|WinID_MenuCharStats), (Window_queue).w
	addq.w	#1, (Window_routine_3).w
	move.b	#SFXID_Revived, (Sound_queue).w
	lea	(Character_stats+max_hp).w, a2
	move.w	(Character_index_2).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.w	(a2), -(a2)
loc_A1F0:
	rts
loc_A1F2:
	subq.w	#1, d1
	bne.s	loc_A1FA
	bsr.w	WaitJoypad_B_C_Pressed
loc_A1FA:
	bne.w	ItemAction_CloseMenu
	rts

NeiSword_ItemSelected:
	tst.w	d1
	bne.s	loc_A21E
	move.w	#$12, (Script_queue).w
	cmpi.w	#MapID_NoahGroundF, (Map_index).w
	bcc.s	+									;  we can use this item only on Noah
	move.w	#$27, (Script_queue).w		; if you're not on Noah, display text that it cannot be used
	addq.w	#1, (Window_routine_3).w
+
	rts


loc_A21E:
	subq.w	#1, d1
	bne.w	CloseAllWindows
	move.w	#MapID_EsperMansionF1, (Map_index).w	; move to Esper Mansion after using Nei Sword
	move.w	#$100, (Map_Y_pos).w
	move.w	#$100, (Map_X_pos).w
	move.w	#-1, (Screen_changed_flag).w
	addq.w	#1, (Window_routine_3).w
	move.b	#SFXID_Teleport, (Sound_queue).w
-
	cmpi.b	#$80, (Track_timer).w
	bne.s	-
	rts

Teim_ItemSelected:
	tst.w	d1
	bne.w	CloseAllWindows
	move.w	#$25, (Script_queue).w
	rts

Visiphone_ItemSelected:
	tst.w	d1
	bne.w	+		; move to data memory
	move.w	#$28, (Script_queue).w
	rts

+
	move.w	#SceneID_DataMemory, (Scene_index).w
	move.w	#9, (Portrait_index).w
	move.w	#0, ($FFFFF764).w
	move.w	#1, ($FFFFF766).w
	move.b	#GameModeID_Scene, (Game_mode_index).w
	move.w	(Characters_RAM+y_pos).w, d0		; get characters' y position
	andi.w	#$FFF0, d0
	move.w	d0, (Map_Y_pos).w ; and save it
	move.w	(Characters_RAM+x_pos).w, d0		; get characters' x position
	andi.w	#$FFF0, d0
	move.w	d0, (Map_X_pos).w ; and save it
	rts
; -------------------------------------------
ItemAction_GiveEntry:
	move.w	(Window_routine_3).w, d1
	bne.s	loc_A2B6
	move.w	#WinID_ChosenItemChar, (Window_queue).w
	addq.w	#1, (Window_routine_3).w
	rts
loc_A2B6:
	subq.w	#1, d1
	bne.w	loc_A342
	lea	(Character_stats).w, a2
	move.w	(Character_index_2).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	tst.w	2(a2)
	bne.s	loc_A2DC
	move.w	#$102, (Script_queue).w
	move.w	#1, ($FFFFDE8C).w
	bra.s	loc_A336
loc_A2DC:
	moveq	#0, d0
	move.b	$27(a2), d0
	lsr.b	#4, d0
	andi.b	#1, d0
	move.w	d0, ($FFFFDE8C).w
	move.w	#$A, (Script_queue).w		; "'Character' can't carry any more items."
	cmpi.b	#ItemID_PlsmRing, (Item_index).w
	bne.s	loc_A306
	move.w	#$F, (Script_queue).w		; "'Character' can't let go of the item!"
	moveq	#1, d0
	move.w	d0, ($FFFFDE8C).w
loc_A306:
	tst.b	d0
	bne.s	loc_A336
	move.w	#$24, (Script_queue).w
	move.w	(Character_index).w, d0
	cmp.w	(Character_index_2).w, d0
	beq.s	loc_A336
	move.w	#8, (Script_queue).w
	lea	(Character_stats+curr_hp).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	tst.w	(a2)
	bne.s	loc_A336
	move.w	#9, (Script_queue).w
loc_A336:
	addq.w	#1, (Window_routine_3).w
	move.w	#WinID_ScriptMessage, (Window_queue).w
	rts
loc_A342:
	move.w	($FFFFDE8C).w, d0
	lsl.w	#2, d0
	andi.w	#$C, d0
	jmp	loc_A350(pc,d0.w)

loc_A350:
	bra.w	loc_A358
	bra.w	loc_A368
loc_A358:
	bsr.w	loc_AE2E
	bsr.w	RemoveItemFromInventory
	bsr.w	AddItemToInventory
	bra.w	CloseAllWindows
loc_A368:
	bra.w	Win_CloseCurrent
; -------------------------------------------
ItemAction_TossEntry:
	move.w	(Window_routine_3).w, d1
	bne.s	ItemToss_ProcessAction
	lea	(Character_stats+curr_hp).w, a2
	move.w	(Character_index).w, d0
	lsl.w	#6, d0
	adda.w	d0, a2
	tst.w	(a2)
	bne.s	loc_A390

	move.w	#0, ($FFFFDE8C).w
	move.w	#6, (Script_queue).w
	bra.s	loc_A3BC

loc_A390:
	moveq	#0, d0
	move.b	(Item_index).w, d0
	lsl.w	#4, d0
	lea	(InventoryData+$C).l, a0
	adda.w	d0, a0
	move.b	(a0), d0
	rol.b	#1, d0	; rotate left to move the most significant bit in bit 0
	andi.w	#1, d0	; we want to get the value for this bit - either 0 or 1
	move.w	d0, ($FFFFDE8C).w		; move this value to use later as an index
	move.w	#$C, (Script_queue).w	; "Do you really want to drop 'ITEM'?"
	tst.b	d0
	bne.s	loc_A3BC
	move.w	#$B, (Script_queue).w	; "It's not a good idea to throw 'ITEM' away."
loc_A3BC:
	addq.w	#1, (Window_routine_3).w
	move.w	#WinID_ScriptMessage, (Window_queue).w
	move.w	#0, (Window_routine_4).w
	rts

ItemToss_ProcessAction:
	move.w	($FFFFDE8C).w, d0
	lsl.w	#2, d0
	andi.w	#4, d0
	jmp	ItemToss_ResultIndex(pc,d0.w)
; -------------------------------------------
ItemToss_ResultIndex:
	bra.w	ItemToss_CancelAction
	bra.w	ItemToss_CompleteAction
; -------------------------------------------
ItemToss_CancelAction:
	bra.w	Win_CloseCurrent
; -------------------------------------------
ItemToss_CompleteAction:
	move.w	(Window_routine_4).w, d1
	bne.s	loc_A3FA
	move.w	#WinID_YesNo, (Window_queue).w
	addq.w	#1, (Window_routine_4).w
	rts
loc_A3FA:
	subq.w	#1, d1
	bne.s	loc_A416
	move.w	#$E, (Script_queue).w
	move.w	(Yes_no_input).w, d0
	beq.s	loc_A410
	move.w	#$D, (Script_queue).w
loc_A410:
	addq.w	#1, (Window_routine_4).w
	rts

loc_A416:
	move.w	#$8002, d1
	move.w	(Yes_no_input).w, d0
	bne.w	Win_Close
	bsr.w	loc_AE2E
	bsr.w	RemoveItemFromInventory
	;bra.w	CloseAllWindows
	bra.w	ItemAction_CloseMenu
; -------------------------------------------

ItemAction_CloseMenu:
	subq.w	#1, (Window_routine_3).w
	jmp		Win_CloseCurrent