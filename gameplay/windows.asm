RunWindows:
	tst.w	(Window_queue).w
	beq.s	.update		; continue processing an already opened window
	bmi.s	.return	; return if window is being destroyed
	bset	#0, (Window_queue).w		; set initialized flag
	bne.s	.return						; if already initialized, return
	move.w	(Window_queue).w, d0
	andi.w	#$FF, d0		; get window index
	move.w	d0, (Window_index).w
	move.w	#0, (Window_routine).w

.update:
	move.w	(Window_routine).w, d1
	move.w	(Window_index).w, d0
	lsl.w	#2, d0
	andi.w	#$3FC, d0
	jsr	WindowsIndexTable(pc,d0.w)
	cmpi.w	#2, (Window_routine).w
	beq.s	.return
	addq.w	#1, (Window_routine).w	; process next windows routine
.return:
	rts

; ========================================
; table of all the windows in the game
; ========================================
WindowsIndexTable:
	bra.w	Win_RunScript				; 0
	bra.w	Win_PlayerMenu			; 1
	bra.w	Win_MenuItemChar		; 2
	bra.w	Win_MenuItemList		; 3
	bra.w	Win_MenuItemList2		; 4
	bra.w	Win_ItemAction			; 5
	bra.w	Win_ChosenItemChar		; 6
	bra.w	Win_MenuCharStats		; 7
	bra.w	Win_ScriptMessage		; 8
	bra.w	Win_YesNo				; 9
	bra.w	Win_StateOrder			; $A
	bra.w	Win_FirstCharStats		; $B
	bra.w	Win_SecondCharStats		; $C
	bra.w	Win_ThirdCharStats		; $D
	bra.w	Win_FourthCharStats		; $E
	bra.w	Win_MenuMeseta			; $F
	bra.w	Win_CharOrderDestination ; $10
	bra.w	Win_OrderCharList		; $11
	bra.w	Win_MapTechList		; $12
	bra.w	Win_MapTechList2		; $13
	bra.w	Win_StrngHPTP			; $14
	bra.w	Win_StrngStats			; $15
	bra.w	Win_StrngEquip			; $16
	bra.w	Win_StrngLVEXP			; $17
	bra.w	Win_EquipStats			; $18
	bra.w	Win_EqpEquipList		; $19
	bra.w	Win_ItemList2			; $1A
	bra.w	Win_ItemList3			; $1B
	bra.w	Win_ScriptMessageBig	; $1C
	bra.w	Win_FullTechList		; $1D
	bra.w	Win_FullTechList2		; $1E
	bra.w	Win_YesNo2				; $1F
	bra.w	Win_YesNo3				; $20
	bra.w	Win_ScriptMessage		; $21
	bra.w	Win_BuySell				; $22
	bra.w	Win_StoreMeseta			; $23
	bra.w	Win_NameInput			; $24
	bra.w	Win_SaveSlots			; $25
	bra.w	Win_LibraryOptions		; $26
	bra.w	Win_HealCure			; $27
	bra.w	Win_StoreInventory		; $28
	bra.w	Win_RolfHouseOptions	; $29
	bra.w	WinProfileCharList		; $2A
	bra.w	Win_CharProfiles		; $2B
	bra.w	Win_CharProfiles		; $2C
	bra.w	Win_CharProfiles		; $2D
	bra.w	Win_CharProfiles		; $2E
	bra.w	Win_CharProfiles		; $2F
	bra.w	Win_CharProfiles		; $30
	bra.w	Win_CharProfiles		; $31
	bra.w	Win_CharProfiles		; $32
	bra.w	Win_RegroupCharList		; $33
	bra.w	Win_RegroupSelectedChar	; $34
	bra.w	Win_CentTowerOptions	; $35
	bra.w	Win_CentTowerOptions2	; $36
	bra.w	Win_GameSelect			; $37
	bra.w	Win_RoomOptions			; $38
	bra.w	Win_RightLeft			; $39
	bra.w	Win_StrngCharList		; $3A
	bra.w	Win_RolfPortrait		; $3B
	bra.w	Win_Portraits			; $3C
	bra.w	Win_Portraits			; $3D
	bra.w	Win_Portraits			; $3E
	bra.w	Win_Portraits			; $3F
	bra.w	Win_Portraits			; $40
	bra.w	Win_Portraits			; $41
	bra.w	Win_Portraits			; $42
	bra.w	Win_Portraits			; $43
	bra.w	Win_Portraits			; $44
	bra.w	Win_Portraits			; $45
	bra.w	Win_Portraits			; $46
	bra.w	Win_Portraits			; $47
	bra.w	Win_Portraits			; $48
	bra.w	Win_Portraits			; $49
	bra.w	Win_Portraits			; $4A
	bra.w	Win_Portraits			; $4B
	bra.w	Win_Portraits			; $4C
	bra.w	Win_Portraits			; $4D
	bra.w	Win_Portraits			; $4E
	bra.w	Win_Portraits			; $4F
	bra.w	Win_Portraits			; $50
	bra.w	Win_Portraits			; $51
	bra.w	Win_Portraits			; $52
	bra.w	Win_Portraits			; $53
	bra.w	Win_RolfPortrait		; $54
	bra.w	Win_RolfPortrait		; $55
	bra.w	Win_Portraits			; $56
	bra.w	Win_Portraits			; $57
	bra.w	Win_Portraits			; $58
	bra.w	Win_Portraits			; $59
	bra.w	Win_StrngLVEXP			; $5A
	bra.w	Win_StoreCharList		; $5B
	bra.w	Win_BattleFirstCharStats ; $5C
	bra.w	Win_BattleSecondCharStats ; $5D
	bra.w	Win_BattleThirdCharStats ; $5E
	bra.w	Win_BattleFourthCharStats ; $5F
	bra.w	Win_BattleOptions		; $60
	bra.w	Win_BattleOptions2		; $61
	bra.w	Win_BattleCharName		; $62
	bra.w	Win_BattleCommands		; $63
	bra.w	Win_EnemyGroups			; $64
	bra.w	Win_BattleMessage		; $65
	bra.w	Win_BattleTechList		; $66
	bra.w	Win_BattleItemList		; $67
	bra.w	Win_BattleItemUsed		; $68
	bra.w	Win_BattleTechUsed		; $69
	bra.w	Win_FirstEnemyName		; $6A
	bra.w	Win_SecondEnemyName		; $6B
	bra.w	Win_FirstEnemyInfo		; $6C
	bra.w	Win_SecondEnemyInfo		; $6D
	bra.w	Win_BattleEmptySpots	; $6E
	bra.w	Win_BattleEmptySpots	; $6F
	bra.w	Win_BattleEmptySpots	; $70
	bra.w	Win_BattleEmptySpots	; $71
	bra.w	Win_RolfPortrait		; $72
	bra.w	Win_TeleportPlaceNames	; $73
	bra.w	Win_UstvestiaSoundtracks ; $74
; ========================================

Win_RunScript:
	tst.w	(Script_flag).w
	beq.s	+
	bsr.w	ScriptControlCodes
+
	bsr.w	CheckLoadScript
	rts
; ----------------------------------------
Win_PlayerMenu:
	tst.b	d1
	bne.s	+
	rts

+
	subq.w	#1, d1
	bne.s	+
	move.w	#4, d0					; five entries to move cursor through
	move.w	#$90, d1
	move.w	#$90, d2
	bra.w	LoadCursorInWindows

+
	lea	($FFFFDE80).w, a0
	bra.w	Win_GetInputCloseCurrent
; ----------------------------------------
Win_MenuItemChar:
	tst.b	d1
	bne.s	+
	lea	(loc_11412).l, a3
	bra.s	loc_F83A

+
	subq.w	#1, d1
	bne.s	loc_F814
	move.w	(Party_members_num).w, d0
	move.w	#$A8, d1
	move.w	#$D8, d2
	bra.w	LoadCursorInWindows
loc_F814:
	lea	($FFFFDE82).w, a0
	move.w	#$8001, d1
	cmpi.w	#2, ($FFFFDE80).w
	bne.s	loc_F828
	move.w	#$8002, d1
loc_F828:
	bsr.w	Win_GetInput
	lea	(Party_member_ID).w, a0
	add.w	d1, d1
	adda.w	d1, a0
	move.w	(a0), (Character_index).w
	rts
loc_F83A:
	lea	(PlaneMap_WinCharList).l, a1
	lea	(Window_art_buffer+PlaneMap_WinCharList-DynamicWindowsStart).w, a2
	move.w	#$F, d0
loc_F848:
	move.l	(a1)+, (a2)+	; WARNING: a2 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	dbf	d0, loc_F848

	lea	(Party_member_ID).w, a0
	lea	(Window_art_buffer+PlaneMap_WinCharList-DynamicWindowsStart+8).w, a1
	move.w	(Party_members_num).w, d0
loc_F85A:
	lea	(Character_stats+name).w, a2
	move.w	(a0)+, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.l	(a2)+, (a1)	; WARNING: a1 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	addq.w	#6, a1
	move.l	(a2), (a1); WARNING: a2 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	addq.w	#6, a1
	dbf	d0, loc_F85A

	subq.w	#1, a1
	lea	(Window_art_buffer+PlaneMap_WinCharList-DynamicWindowsStart+$37).w, a1
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	addq.w	#2, a1
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	rts
; ----------------------------------------
Win_MenuItemList:
	tst.b	d1
	bne.s	loc_F8B0
	lea	(loc_1141A).l, a3
	lea	(Character_stats+item_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.b	(a2), d0
	cmpi.b	#9, d0
	bcs.s	loc_F8AA		; branch if character is carrying less than 9 items
	addq.w	#8, a3			; display NEXT string
loc_F8AA:
	lea	(Character_stats+items).w, a2
	bra.s	loc_F922

loc_F8B0:
	subq.w	#1, d1
	bne.s	loc_F8E0
	lea	(Character_stats+item_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	moveq	#0, d0
	move.b	(a2), d0
	move.w	#$98, d2
	subq.w	#1, d0
	cmpi.b	#8, d0
	bcs.s	loc_F8D8
	move.w	#$108, d0
	move.w	#$88, d2
loc_F8D8:
	move.w	#$F8, d1
	bra.w	LoadCursorInWindows

loc_F8E0:
	lea	(Inventory_offset).w, a0
	bsr.w	Win_GetInputCloseCurrent
	andi.b	#$20, d0
	beq.s	loc_F920		; branch if C was not pressed
	cmpi.b	#8, ($FFFFDE51).w
	bne.s	loc_F906
	tst.w	d1
	bne.s	loc_F902
	move.w	#WinID_MenuItemList2, (Window_queue).w
	rts

loc_F902:
	subq.w	#1, (Inventory_offset).w
loc_F906:
	lea	(Character_stats+items).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	adda.w	(Inventory_offset).w, a2
	move.b	(a2), d0
	andi.b	#$7F, d0
	move.b	d0, (Item_index).w
loc_F920:
	rts

loc_F922:
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	lea	(Window_art_buffer+PlaneMap_WinMenuItemList-DynamicWindowsStart).w, a1
	move.l	(a3)+, (a1)+	; WARNING: a1 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	move.l	(a3), (a1)+
	addq.w	#5, a1
	move.w	#7, d0
loc_F938:
	moveq	#0, d3
	bsr.s	loc_F948
	moveq	#1, d3
	bsr.s	loc_F948
	addq.w	#1, a2
	dbf	d0, loc_F938

	rts

loc_F948:
	move.b	#$26, (a1)
	move.b	(a2), d1
	bpl.s	loc_F958
	tst.w	d3
	beq.s	loc_F958
	move.b	#$A3, (a1)
loc_F958:
	addq.w	#3, a1
loc_F95A:
	andi.w	#$7F, d1
	lsl.w	#4, d1
	lea	(InventoryData).l, a3
	adda.w	d1, a3
	move.w	#9, d2
loc_F96C:
	moveq	#0, d1
	move.b	(a3)+, d1
	add.w	d1, d1
	add.w	d3, d1
	lea	(VDPCharacterMaps).l, a4
	adda.w	d1, a4
	move.b	(a4), (a1)+
	dbf	d2, loc_F96C

	rts
; ----------------------------------------
; loc_F984
Win_MenuItemList2:
	tst.b	d1
	bne.s	loc_F996
	lea	(Character_stats+items_2).w, a2
	lea	(loc_11422).l, a3
	bra.w	loc_F922
loc_F996:
	subq.w	#1, d1
	bne.s	loc_F9BA
	lea	(Character_stats+item_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.w	#$100, d0
	move.b	(a2), d0
	subq.b	#8, d0
	move.w	#$90, d2
	move.w	#$100, d1
	bra.w	LoadCursorInWindows
loc_F9BA:
	lea	(Inventory_offset).w, a0
	move.w	#$8002, d1
	bsr.w	Win_GetInput
	andi.b	#$30, d0
	beq.s	loc_FA10
; Fix: input
	if bugfixes=1
	andi.b	#$20, d0
	bne.s	loc_F9D4
	else
	andi.b	#$10, d0
	beq.s	loc_F9D4
	endif
	rts
loc_F9D4:
	tst.w	(Inventory_offset).w
	bne.s	loc_F9F2
	move.w	#$8001, (Window_queue).w
	lea	($FFFFDEEE).w, a1
	move.w	(Windows_opened_num).w, d1
	lsl.w	#4, d1
	adda.w	d1, a1
	move.w	(a1), (Window_index).w
	rts
loc_F9F2:
	addq.w	#7, (Inventory_offset).w
	lea	(Character_stats+items).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	adda.w	(Inventory_offset).w, a2
	move.b	(a2), d0
	andi.b	#$7F, d0
	move.b	d0, (Item_index).w
loc_FA10:
	rts
; ----------------------------------------
; loc_FA12
Win_ItemAction:
	tst.b	d1
	bne.s	loc_FA18
	rts
loc_FA18:
	subq.w	#1, d1
	bne.s	loc_FA2C
	move.w	#2, d0
	move.w	#$178, d1
	move.w	#$90, d2
	bra.w	LoadCursorInWindows
loc_FA2C:
	lea	($FFFFDE88).w, a0
	bra.w	Win_GetInputCloseCurrent
; ----------------------------------------
; loc_FA34
Win_ChosenItemChar:
	tst.b	d1
	bne.s	loc_FA44
	lea	(loc_1142A).l, a3
	bsr.w	loc_F83A
	rts
loc_FA44:
	subq.w	#1, d1
	bne.s	loc_FA58
	move.w	(Party_members_num).w, d0
	move.w	#$180, d1
	move.w	#$D8, d2
	bra.w	LoadCursorInWindows
loc_FA58:
	lea	($FFFFDE8A).w, a0
	bsr.w	Win_GetInputCloseCurrent
	lea	(Party_member_ID).w, a0
	add.w	d1, d1
	adda.w	d1, a0
	move.w	(a0), (Character_index_2).w
	rts
; ----------------------------------------
; loc_FA6E
Win_MenuCharStats:
	move.w	#0, (Window_index).w
	lea	(PlaneMap_WinMenuCharStats).l, a1
	lea	(Window_art_buffer+PlaneMap_WinMenuCharStats-DynamicWindowsStart).w, a2
	move.w	#$2E, d0
loc_FA82:
	move.l	(a1)+, (a2)+	; WARNING: a2 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	dbf	d0, loc_FA82
	lea	(Party_member_ID).w, a0
	lea	(Window_art_buffer+PlaneMap_WinMenuCharStats-DynamicWindowsStart+$1C).w, a1
	move.w	(Party_members_num).w, d5
loc_FA94:
	lea	(Character_stats+name).w, a3
	move.w	(a0)+, d1
	lsl.w	#6, d1
	adda.w	d1, a3
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	adda.w	#$17, a1
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	if revision=0
	adda.w	#$16, a1
	else
	adda.w	#$31, a1
	endif
	suba.w	#$40, a3
	lea	(loc_11432).l, a2
	move.w	(a3)+, d0
	tst.w	(a3)
	beq.s	loc_FACE
	addq.w	#4, a2
	tst.w	d0
	bmi.s	loc_FACE
	addq.w	#4, a2
loc_FACE:
	move.b	(a2)+, (a1)+
	move.b	(a2)+, (a1)+
	adda.w	#$19, a1
	move.b	(a2)+, (a1)+
	move.b	(a2)+, (a1)+
	if revision=0
	addq.w	#1, a1
	else
	suba.w	#$1A, a1
	endif
	move.w	(a3), d0
	bsr.w	DrawDec3Digits
	adda.w	#$18, a1
	addq.w	#4, a3
	move.w	(a3), d0
	bsr.w	DrawDec3Digits
	suba.w	#$6A, a1
	dbf	d5, loc_FA94

	rts
; ----------------------------------------
; loc_FAFA
Win_ScriptMessage:
	tst.b	d1
	bne.s	loc_FB00
	rts

loc_FB00:
	subq.w	#1, d1
	bne.s	loc_FB4E
	lea	(Window_draw_cache).w, a0
	move.w	(Windows_opened_num).w, d0
	subq.w	#1, d0
	lsl.w	#4, d0
	adda.w	d0, a0
	move.w	(a0), d0
	move.b	d0, d6
	andi.b	#$80, d6
	addq.b	#2, d0
	andi.b	#$7F, d0
	or.b	d6, d0
	addi.w	#$80, d0
	andi.w	#$CFFF, d0
	move.w	d0, (Text_plane_offset).w
	move.w	d0, (Text_plane_offset_start).w
	bsr.w	CheckLoadScript
	move.w	#0, (Text_curr_line).w
	move.w	#2, (Text_max_line_num).w
	move.w	#3, (Text_line_scroll_speed).w
	move.w	#$3C, (Text_auto_timer).w
loc_FB4E:
	move.w	#0, (Window_index).w
	rts


; -----------------------------------------------------------------
ScriptControlCodes:
	movea.l	(Text_offset).w, a0
	move.b	(a0)+, d0	; get text byte
	cmpi.b	#$C3, d0
	bne.s	loc_FB7A
; $C3 = halts text rendering until a button is pressed
	move.b	(Joypad_pressed).w, d0
	andi.b	#Button_B_Mask|Button_C_Mask|Button_A_Mask, d0
	beq.w	loc_FBFE
	move.b	#SFXID_Selection, (Sound_queue).w
	move.l	a0, (Text_offset).w
	rts
loc_FB7A:
	cmpi.b	#$C4, d0
	bne.s	loc_FB84
; $C4 = terminate script
	bsr.s	Script_Terminate
	rts
loc_FB84:
	cmpi.b	#$C5, d0
	bne.s	loc_FB92
; $C5 = terminate script without user input
	move.w	#0, (Script_flag).w
	rts
loc_FB92:
	cmpi.b	#$C6, d0
	bne.s	loc_FBCE
; $C6 = either wait for user input or a timer to terminate the script
	subq.w	#1, (Text_auto_timer).w
	bmi.s	loc_FBA8
	move.b	(Joypad_pressed).w, d0
	andi.b	#Button_B_Mask|Button_C_Mask|Button_A_Mask, d0
	beq.s	loc_FBFE
loc_FBA8:
	move.b	#SFXID_Selection, (Sound_queue).w
	move.w	#$3C, (Text_auto_timer).w
	move.w	#0, (Joypad_held).w
	move.w	#0, (Script_flag).w
	lea	(Window_queue).w, a1
loc_FBC4:
	tst.w	(a1)+
	bne.s	loc_FBC4
	move.w	#$8001, -(a1)
	rts
loc_FBCE:
	cmpi.b	#$C7, d0
	bne.s	loc_FBE8
; $C7 = wait until timer expires to terminate the script
	subq.w	#1, (Text_auto_timer).w
	bpl.s	loc_FBFE
	move.w	#$3C, (Text_auto_timer).w
	move.w	#0, (Script_flag).w
	rts
loc_FBE8:
	move.b	(Joypad_pressed).w, d0
	andi.b	#Button_B_Mask|Button_C_Mask|Button_A_Mask, d0
	beq.s	loc_FBFE
	tst.w	(Opening_ending_flag).w
	bne.s	loc_FBFE
; if a button is pressed, text will be rendered all at once
	move.w	#1, (Text_render_type).w
loc_FBFE:
	rts

Script_Terminate:
	move.b	(Joypad_pressed).w, d0
	andi.b	#Button_B_Mask|Button_C_Mask|Button_A_Mask, d0
	beq.s	loc_FC16
	move.b	#SFXID_Selection, (Sound_queue).w
	move.w	#0, (Script_flag).w
loc_FC16:
	rts
; -----------------------------------------------------------------


; ----------------------------------------
; loc_FC18
Win_YesNo:
	tst.b	d1
	bne.s	loc_FC1E
	rts
loc_FC1E:
	subq.w	#1, d1
	bne.s	loc_FC32
	move.w	#1, d0
	move.w	#$178, d1
	move.w	#$E0, d2
	bra.w	LoadCursorInWindows
loc_FC32:
	lea	(Yes_no_input).w, a0
	move.w	#$8002, d1
	bra.w	Win_GetInput
; ----------------------------------
; loc_FC3E
Win_YesNo2:
	tst.b	d1
	bne.s	loc_FC44
	rts
loc_FC44:
	subq.w	#1, d1
	bne.s	loc_FC58
	move.w	#1, d0
	move.w	#$180, d1
	move.w	#$118, d2
	bra.w	LoadCursorInWindows
loc_FC58:
	lea	(Yes_no_input).w, a0
	move.b	(Joypad_pressed).w, d0
	andi.b	#Button_B_Mask|Button_C_Mask, d0
	beq.s	loc_FC88
	move.w	#$8001, (Window_queue).w
	move.b	#SFXID_Selection, (Sound_queue).w
	moveq	#0, d1
	move.w	d1, (Window_index).w
	move.b	(Window_current_option).w, d1
	move.w	d1, (a0)
	andi.b	#Button_B_Mask, d0
	beq.s	loc_FC88
	move.w	#1, (a0)
loc_FC88:
	rts
; --------------------------------------------
; loc_FC8A
Win_YesNo3:
	tst.b	d1
	bne.s	loc_FC90
	rts
loc_FC90:
	subq.w	#1, d1
	bne.s	loc_FCA4
	move.w	#1, d0
	move.w	#$108, d1
	move.w	#$E8, d2
	bra.w	LoadCursorInWindows

loc_FCA4:
	bsr.w	loc_11010
	tst.w	(Window_index).w
	bne.s	loc_FCCA
	moveq	#0, d1
	move.b	(Window_current_option).w, d1
	move.w	d1, (Yes_no_input).w
	move.w	#$8001, (Window_queue).w
	andi.b	#Button_B_Mask, d0
	beq.s	loc_FCCA
	move.w	#1, (Yes_no_input).w
loc_FCCA:
	rts
; ----------------------------------------
; loc_FCCC
Win_StateOrder:
	tst.b	d1
	bne.s	loc_FCD2
	rts
loc_FCD2:
	subq.w	#1, d1
	bne.s	loc_FCE6
	move.w	#1, d0
	move.w	#$98, d1
	move.w	#$E8, d2
	bra.w	LoadCursorInWindows
loc_FCE6:
	lea	($FFFFDE92).w, a0
	bra.w	Win_GetInputCloseCurrent
; ----------------------------------------
; loc_FCEE
Win_FirstCharStats:
	move.w	(Party_member_ID).w, d1		; Character in 1st position
	bra.s	loc_FD04
; ----------------------------------------
; loc_FCF4
Win_SecondCharStats:
	move.w	(Party_member_ID+2).w, d1	; Character in 2nd position
	bra.s	loc_FD04
; ----------------------------------------
; loc_FCFA
Win_ThirdCharStats:
	move.w	(Party_member_ID+4).w, d1	; Character in 3rd position
	bra.s	loc_FD04
; ----------------------------------------
; loc_FD00
Win_FourthCharStats:
	move.w	(Party_member_ID+6).w, d1	; Character in 4th position

loc_FD04:
	move.w	#0, (Window_index).w
	lea	(Window_art_buffer+PlaneMap_WinIndividualCharStats-DynamicWindowsStart+$D).w, a1
	bsr.s	loc_FD50
	subq.w	#8, a3
	lea	(loc_1143E).l, a2
	move.w	(a3)+, d0
	tst.w	(a3)
	beq.s	loc_FD26
	addq.w	#4, a2
	tst.w	d0
	bmi.s	loc_FD26
	addq.w	#4, a2
loc_FD26:
	move.b	(a2)+, (a1)+
	move.b	(a2)+, (a1)+
	adda.w	#8, a1
	move.b	(a2)+, (a1)+
	move.b	(a2)+, (a1)+
	addq.w	#8, a3
	lea	(Window_art_buffer+PlaneMap_WinIndividualCharStats-DynamicWindowsStart+$34).w, a1
	move.w	(a3)+, d0
	bsr.w	DrawDec2Digits
	addq.w	#1, a1
	adda.w	#$30, a3
	move.l	(a3), (a1)	; WARNING: a1 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	subq.w	#4, a3
	lea	(Window_art_buffer+PlaneMap_WinIndividualCharStats-DynamicWindowsStart+$2D).w, a1
	move.l	(a3), (a1)	; same as above
	rts
loc_FD50:
	lea	(Character_stats+curr_hp).w, a3
	lsl.w	#6, d1
	adda.w	d1, a3
	move.w	(a3)+, d0
	bsr.w	DrawDec3Digits
	addq.w	#1, a1
	move.w	(a3)+, d0
	bsr.w	DrawDec3Digits
	adda.w	#$D, a1
	move.w	(a3)+, d0
	bsr.w	DrawDec3Digits
	addq.w	#1, a1
	move.w	(a3), d0
	bra.w	DrawDec3Digits
; ----------------------------------------
; loc_FD78
Win_MenuMeseta:
	tst.b	d1
	beq.s	loc_FD8C
	lea	($FFFFDE96).w, a0
	move.w	#$8002, d1
	add.w	(Party_members_num).w, d1
	bra.w	Win_GetInput
loc_FD8C:
	lea	(Window_art_buffer+PlaneMap_WinMeseta-DynamicWindowsStart+$E).w, a1
	move.l	(Current_money).w, d0
	bra.w	DrawDec8Digits
; ----------------------------------------
; loc_FD98
Win_CharOrderDestination:
	move.w	#0, (Window_index).w
	lea	(Window_art_buffer+PlaneMap_WinCharOrderDestination-DynamicWindowsStart+8).w, a1
	lea	(PlaneMap_WinCharOrderDestination).l, a3
	lea	(Window_art_buffer+PlaneMap_WinCharOrderDestination-DynamicWindowsStart).w, a2
	move.w	#$E, d0
loc_FDB0:
	move.l	(a3)+, (a2)+	; WARNING: a2 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	dbf	d0, loc_FDB0
	lea	($FFFFC610).w, a0
	move.w	($FFFFC602).w, d0
	bmi.s	loc_FDD6
loc_FDC0:
	lea	(Character_stats+name).w, a2
	move.w	(a0)+, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.l	(a2)+, (a1)
	addq.w	#6, a1
	move.l	(a2), (a1)
	addq.w	#6, a1
	dbf	d0, loc_FDC0
loc_FDD6:
	rts
; ----------------------------------------
; loc_FDD8
Win_OrderCharList:
	tst.b	d1
	bne.s	loc_FDE2
	lea	(Window_art_buffer+PlaneMap_WinCharList2-DynamicWindowsStart+8).w, a1
	bra.s	loc_FE10
loc_FDE2:
	subq.w	#1, d1
	bne.s	loc_FDF6
	move.w	($FFFFDE9A).w, d0
	move.w	#$168, d1
	move.w	#$C8, d2
	bra.w	LoadCursorInWindows
loc_FDF6:
	lea	($FFFFDE9A).w, a0
	move.w	#$8002, d1
	bsr.w	Win_GetInput
	lea	($FFFFC618).w, a0
	add.w	d1, d1
	adda.w	d1, a0
	move.w	(a0), (Character_index).w
	rts
loc_FE10:
	lea	(PlaneMap_WinCharList2).l, a3
	lea	(Window_art_buffer+PlaneMap_WinCharList2-DynamicWindowsStart).w, a2
	move.w	#$E, d0
loc_FE1E:
	move.l	(a3)+, (a2)+; WARNING: a2 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	dbf	d0, loc_FE1E
	lea	($FFFFC618).w, a0
	move.w	#$FFFF, ($FFFFDE9A).w
	move.w	(Party_members_num).w, d0
loc_FE32:
	lea	(Character_stats+name).w, a2
	move.w	(a0)+, d1
	bmi.s	loc_FE4A
	lsl.w	#6, d1
	adda.w	d1, a2
	move.l	(a2)+, (a1)
	addq.w	#6, a1
	move.l	(a2), (a1)
	addq.w	#6, a1
	addq.w	#1, ($FFFFDE9A).w
loc_FE4A:
	dbf	d0, loc_FE32

	rts
; ----------------------------------------
Win_MapTechList:
	tst.b	d1
	bne.s	loc_FE7E
	bsr.w	loc_112C4
	lea	(loc_1144A).l, a3
	lea	(Character_stats+map_tech_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.b	(a2), d0
	andi.w	#$1F, d0
	cmpi.b	#9, d0
	bcs.s	loc_FE78
	addq.w	#6, a3
loc_FE78:
	lea	($FFFFC800).w, a2
	bra.s	loc_FEF2
loc_FE7E:
	subq.w	#1, d1
	bne.s	loc_FEB0
	lea	(Character_stats+map_tech_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.b	(a2), d0
	andi.w	#$1F, d0
	move.w	#$98, d2
	subq.w	#1, d0
	cmpi.b	#8, d0
	bcs.s	loc_FEA8
	move.w	#$108, d0
	move.w	#$88, d2
loc_FEA8:
	move.w	#$E8, d1
	bra.w	LoadCursorInWindows
loc_FEB0:
	lea	($FFFFDE9C).w, a0
	bsr.w	Win_GetInputCloseCurrent
	andi.b	#$20, d0
	beq.s	loc_FEF0
	cmpi.b	#8, ($FFFFDE51).w
	bne.s	loc_FED6
	tst.w	d1
	bne.s	loc_FED2
	move.w	#WinID_MapTechList2, (Window_queue).w
	rts
loc_FED2:
	subq.w	#1, ($FFFFDE9C).w
loc_FED6:
	lea	($FFFFC800).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#5, d1
	adda.w	d1, a2
	adda.w	($FFFFDE9C).w, a2
	move.b	(a2), d0
	andi.b	#$3F, d0
	move.b	d0, (Technique_index).w
loc_FEF0:
	rts
loc_FEF2:
	move.w	(Character_index).w, d1
	lsl.w	#5, d1
	adda.w	d1, a2
	lea	(Window_art_buffer+PlaneMap_WinMapTechList-DynamicWindowsStart).w, a1
	move.l	(a3)+, (a1)+	; WARNING: a1 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	move.w	(a3), (a1)+
	addq.w	#1, a1
	move.w	#7, d0
loc_FF08:
	moveq	#0, d3
	bsr.s	loc_FF18
	moveq	#1, d3
	bsr.s	loc_FF18
	addq.w	#1, a2
	dbf	d0, loc_FF08
	rts
loc_FF18:
	addq.w	#2, a1
	move.b	(a2), d1
loc_FF1C:
	andi.w	#$3F, d1
	lsl.w	#3, d1
	lea	(TechniqueData).l, a3
	adda.w	d1, a3
	move.w	#4, d2
loc_FF2E:
	moveq	#0, d1
	move.b	(a3)+, d1
	add.w	d1, d1
	add.w	d3, d1
	lea	(VDPCharacterMaps).l, a4
	adda.w	d1, a4
	move.b	(a4), (a1)+
	dbf	d2, loc_FF2E

	rts
; ----------------------------------------
; loc_FF46
Win_MapTechList2:
	tst.b	d1
	bne.s	loc_FF58
	lea	($FFFFC808).w, a2
	lea	(loc_11450).l, a3
	bra.w	loc_FEF2
loc_FF58:
	subq.w	#1, d1
	bne.s	loc_FF80
	lea	(Character_stats+map_tech_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.w	#$100, d0
	move.b	(a2), d0
	andi.w	#$11F, d0
	subq.b	#8, d0
	move.w	#$90, d2
	move.w	#$F0, d1
	bra.w	LoadCursorInWindows
loc_FF80:
	lea	($FFFFDE9C).w, a0
	move.w	#$8002, d1
	bsr.w	Win_GetInput
	andi.b	#$30, d0
	beq.s	loc_FFD6
; Fix: input
	if bugfixes=1
	andi.b	#$20, d0
	bne.s	loc_FF9A
	else
	andi.b	#$10, d0
	beq.s	loc_FF9A
	endif
	rts
loc_FF9A:
	tst.w	($FFFFDE9C).w
	bne.s	loc_FFB8
	move.w	#$8001, (Window_queue).w
	lea	($FFFFDEEE).w, a1
	move.w	(Windows_opened_num).w, d1
	lsl.w	#4, d1
	adda.w	d1, a1
	move.w	(a1), (Window_index).w
	rts
loc_FFB8:
	addq.w	#7, ($FFFFDE9C).w
	lea	($FFFFC800).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#5, d1
	adda.w	d1, a2
	adda.w	($FFFFDE9C).w, a2
	move.b	(a2), d0
	andi.b	#$3F, d0
	move.b	d0, (Technique_index).w
loc_FFD6:
	rts
; ----------------------------------------------------
; loc_FFD8
Win_StrngHPTP:
	lea	(Window_art_buffer+PlaneMap_WinStrngHPTP-DynamicWindowsStart+$D).w, a1
	move.w	(Character_index).w, d1
	bsr.w	loc_FD50
	move.w	#0, (Window_index).w
	rts
; ----------------------------------------------------
; loc_FFEC
Win_StrngStats:
	lea	(Window_art_buffer+PlaneMap_WinStrngStats-DynamicWindowsStart+$13).w, a1
	move.w	(Character_index).w, d1
	bsr.w	loc_10000
	move.w	#0, (Window_index).w
	rts
loc_10000:
	lea	(Character_stats+strength).w, a3
	lsl.w	#6, d1
	adda.w	d1, a3
	move.w	(a3)+, d0
	bsr.w	DrawDec3Digits
	adda.w	#$13, a1
	move.w	(a3)+, d0
	bsr.w	DrawDec3Digits
	adda.w	#$13, a1
	move.w	(a3)+, d0
	bsr.w	DrawDec3Digits
	adda.w	#$13, a1
	move.w	(a3)+, d0
	bsr.w	DrawDec3Digits
	adda.w	#$13, a1
	move.w	(a3)+, d0
	bsr.w	DrawDec3Digits
	adda.w	#$13, a1
	addq.w	#2, a3
	move.w	(a3)+, d0
	bsr.w	DrawDec3Digits
	adda.w	#$13, a1
	move.w	(a3)+, d0
	bra.w	DrawDec3Digits
; ----------------------------------------
; loc_1004C
Win_StrngEquip:
	tst.b	d1
	beq.s	loc_10076
	lea	($FFFFDEA4).w, a0
	move.w	#$8004, d1
	bra.w	Win_GetInput
; ----------------------------------------
; loc_1005C
Win_EqpEquipList:
	tst.b	d1
	beq.s	loc_10076
	lea	($FFFFDEA4).w, a0
	bsr.w	Win_GetInputCloseCurrent
	btst	#Button_B, (Joypad_pressed).w
	beq.s	loc_10074
	addq.w	#1, (Window_routine_3).w
loc_10074:
	rts
loc_10076:
	lea	(Character_stats+equipment).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	lea	(Window_art_buffer+PlaneMap_WinStrngEquip-DynamicWindowsStart+$14).w, a1
	move.w	#4, d0
loc_1008A:
	move.b	(a2), d1
	moveq	#0, d3
	bsr.w	loc_F95A
	addq.w	#5, a1
	move.b	(a2), d1
	moveq	#1, d3
	bsr.w	loc_F95A
	addq.w	#5, a1
	addq.w	#1, a2
	dbf	d0, loc_1008A
	rts

; ------------------------------------------------
; loc_100A6
Win_StrngLVEXP:
	move.w	#0, (Window_index).w
	lea	(Character_stats+name).w, a3
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a3
	lea	(Window_art_buffer+PlaneMap_WinStrngLVEXP-DynamicWindowsStart+$10).w, a1
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	addq.w	#6, a1
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	move.b	(a3)+, (a1)+
	suba.w	#$36, a3
	suba.w	#8, a1
	move.w	(a3)+, d0
	bsr.w	DrawDec2Digits
	lea	(loc_11456).l, a2
	move.w	(Character_index).w, d1
	if revision=0
	lsl.w	#4, d1
	adda.w	d1, a2
	adda.w	#7, a1
	move.l	(a2)+, (a1)+	; WARNING: a1 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	move.l	(a2)+, (a1)+	; same as above
	addq.w	#2, a1
	else
	lsl.w	#3, d1
	adda.w	d1, a2
	adda.w	#$11, a1
	endif
	move.l	(a2)+, (a1)+	; WARNING: a1 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	move.l	(a2)+, (a1)+	; same as above
	adda.w	#$E, a1
	move.l	(a3), d0
	bra.w	DrawDec7Digits

; --------------------------------------------------
; loc_100FC
Win_EquipStats:
	lea	(Window_art_buffer+PlaneMap_WinEquipStats-DynamicWindowsStart+$1E).w, a1
	move.w	(Character_index).w, d1
	bsr.w	loc_10110
	move.w	#0, (Window_index).w
	rts
loc_10110:
	lea	(Character_stats+agility).w, a3
	lsl.w	#6, d1
	adda.w	d1, a3
	move.w	(a3)+, d0
	bsr.w	DrawDec3Digits
	adda.w	#$13, a1
	addq.w	#6, a3
	move.w	(a3)+, d0
	bsr.w	DrawDec3Digits
	adda.w	#$13, a1
	move.w	(a3)+, d0
	bra.w	DrawDec3Digits
; ---------------------------------------
; loc_10134
Win_ItemList2:
	tst.b	d1
	bne.s	loc_1015C
	lea	(loc_1141A).l, a3
	lea	(Character_stats+item_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.b	(a2), d0
	cmpi.b	#9, d0
	bcs.s	loc_10154
	addq.w	#8, a3
loc_10154:
	lea	(Character_stats+items).w, a2
	bra.w	loc_F922
loc_1015C:
	move.w	#1, (Refresh_stats_flag).w
	subq.w	#1, d1
	bne.s	loc_10192
	lea	(Character_stats+item_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	moveq	#0, d0
	move.b	(a2), d0
	move.w	#$98, d2
	subq.w	#1, d0
	cmpi.b	#8, d0
	bcs.s	loc_1018A
	move.w	#$108, d0
	move.w	#$88, d2
loc_1018A:
	move.w	#$148, d1
	bra.w	LoadCursorInWindows
loc_10192:
	lea	(Inventory_offset).w, a0
	move.w	#$8004, d1
	bsr.w	Win_GetInput
	andi.b	#$30, d0
	beq.s	loc_101E4
; Fix: input
	if bugfixes=1
	andi.b	#$20, d0
	bne.s	loc_101B2
	else
	andi.b	#$10, d0
	beq.s	loc_101B2
	endif
	move.w	#0, (Refresh_stats_flag).w
	rts
loc_101B2:
	cmpi.b	#8, ($FFFFDE51).w
	bne.s	loc_101CA
	tst.w	d1
	bne.s	loc_101C6
	move.w	#WinID_ItemList3, (Window_queue).w
	rts
loc_101C6:
	subq.w	#1, (Inventory_offset).w
loc_101CA:
	lea	(Character_stats+items).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	adda.w	(Inventory_offset).w, a2
	move.b	(a2), d0
	andi.b	#$7F, d0
	move.b	d0, (Item_index).w
loc_101E4:
	rts
; -------------------------------------
; loc_101E6
Win_ItemList3:
	tst.b	d1
	bne.s	loc_101F8
	lea	(Character_stats+items_2).w, a2
	lea	(loc_11422).l, a3
	bra.w	loc_F922
loc_101F8:
	move.w	#1, (Refresh_stats_flag).w
	subq.w	#1, d1
	bne.s	loc_10222
	lea	(Character_stats+item_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.w	#$100, d0
	move.b	(a2), d0
	subq.b	#8, d0
	move.w	#$90, d2
	move.w	#$150, d1
	bra.w	LoadCursorInWindows
loc_10222:
	lea	(Inventory_offset).w, a0
	move.w	#$8005, d1
	bsr.w	Win_GetInput
	andi.b	#$30, d0
	beq.s	loc_1027E
; Fix: input
	if bugfixes=1
	andi.b	#$20, d0
	bne.s	loc_10242
	else
	andi.b	#$10, d0
	beq.s	loc_10242
	endif
	move.w	#0, (Refresh_stats_flag).w
	rts
loc_10242:
	tst.w	(Inventory_offset).w
	bne.s	loc_10260
	move.w	#$8001, (Window_queue).w
	lea	($FFFFDEEE).w, a1
	move.w	(Windows_opened_num).w, d1
	lsl.w	#4, d1
	adda.w	d1, a1
	move.w	(a1), (Window_index).w
	rts
loc_10260:
	addq.w	#7, (Inventory_offset).w
	lea	(Character_stats+items).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	adda.w	(Inventory_offset).w, a2
	move.b	(a2), d0
	andi.b	#$7F, d0
	move.b	d0, (Item_index).w
loc_1027E:
	rts
; ---------------------------------------------
; loc_10280
Win_ScriptMessageBig:
	tst.b	d1
	bne.s	loc_1028C
	move.w	#1, ($FFFFDEB0).w
	rts
loc_1028C:
	subq.w	#1, d1
	bne.s	loc_102DA
	lea	(Window_draw_cache).w, a0
	move.w	(Windows_opened_num).w, d0
	subq.w	#1, d0
	lsl.w	#4, d0
	adda.w	d0, a0
	move.w	(a0), d0
	move.b	d0, d6
	andi.b	#$80, d6
	addq.b	#2, d0
	andi.b	#$7F, d0
	or.b	d6, d0
	addi.w	#$80, d0
	andi.w	#$CFFF, d0
	move.w	d0, (Text_plane_offset).w
	move.w	d0, (Text_plane_offset_start).w
	bsr.w	CheckLoadScript
	move.w	#0, (Text_curr_line).w
	move.w	#6, (Text_max_line_num).w
	move.w	#3, (Text_line_scroll_speed).w
	move.w	#$3C, (Text_auto_timer).w
loc_102DA:
	move.w	#0, (Window_index).w
	rts
; -----------------------------------------------
; loc_102E2
Win_FullTechList:
	move.w	#0, (Window_index).w
	bsr.w	loc_112C4
	lea	($FFFFC800).w, a2
loc_102F0:
	move.w	(Character_index).w, d1
	lsl.w	#5, d1
	adda.w	d1, a2
	lea	(Window_art_buffer+PlaneMap_WinFullTechList-DynamicWindowsStart+$B).w, a1
	move.w	#7, d0
loc_10300:
	moveq	#0, d3
	bsr.s	loc_1032E
	addq.w	#6, a1
	moveq	#1, d3
	bsr.s	loc_1032E
	addq.w	#6, a1
	addq.w	#1, a2
	dbf	d0, loc_10300
	lea	(Window_art_buffer+PlaneMap_WinFullTechList-DynamicWindowsStart+$11).w, a1
	move.w	#7, d0
loc_1031A:
	moveq	#0, d3
	bsr.s	loc_1032E
	addq.w	#6, a1
	moveq	#1, d3
	bsr.s	loc_1032E
	addq.w	#6, a1
	addq.w	#1, a2
	dbf	d0, loc_1031A
	rts
loc_1032E:
	move.b	(a2), d1
	andi.w	#$3F, d1
	lsl.w	#3, d1
	lea	(TechniqueData).l, a3
	adda.w	d1, a3
	move.w	#4, d2
loc_10342:
	moveq	#0, d1
	move.b	(a3)+, d1
	add.w	d1, d1
	add.w	d3, d1
	lea	(VDPCharacterMaps).l, a4
	adda.w	d1, a4
	move.b	(a4), (a1)+
	dbf	d2, loc_10342
	rts
; -------------------------------------------
; loc_1035A
Win_FullTechList2:
	lea	($FFFFC810).w, a2
	tst.b	d1
	beq.w	loc_102F0
	lea	($FFFFDEB2).w, a0
	move.w	#$8002, d1
	bra.w	Win_GetInput
; -------------------------------------------
; loc_10370
Win_BuySell:
	tst.b	d1
	bne.s	loc_10376
	rts
loc_10376:
	subq.w	#1, d1
	bne.s	loc_1038A
	move.w	#1, d0
	move.w	#$168, d1
	move.w	#$130, d2
	bra.w	LoadCursorInWindows
loc_1038A:
	lea	($FFFFDEB6).w, a0
	moveq	#0, d1
	bra.w	loc_11028
; -------------------------------------------
; loc_10394
Win_StoreMeseta:
	lea	(Window_art_buffer+PlaneMap_WinMeseta-DynamicWindowsStart+$E).w, a1
	move.l	(Current_money).w, d0
	bsr.w	DrawDec8Digits
	move.w	#0, (Window_index).w
	rts
; -------------------------------------------
; loc_103A8
Win_NameInput:
	tst.b	d1
	bne.s	Win_NameInputRoutine2
	rts
; -------------------------------------------


; -------------------------------------------
Win_NameInputRoutine2:
	subq.w	#1, d1
	bne.s	Win_NameInputRoutine3
	lea	(Object_RAM).w, a0
	move.w	(Windows_opened_num).w, d3
	subq.w	#1, d3
	lsl.w	#6, d3
	adda.w	d3, a0
	move.w	#ObjID_InputWindowCursor, (a0)
	move.w	#0, routine(a0)
	adda.w	#$40, a0
	move.w	#ObjID_NameDestinationTile, (a0)
	move.w	#0, routine(a0)
	move.w	#0, (Window_options).w
	move.w	#0, (Window_name_input_cursor_pos).w
	move.l	#0, (Window_name_input_string).w
	rts
; -------------------------------------------


; -------------------------------------------
Win_NameInputRoutine3:
	move.b	(Joypad_pressed).w, d2
	andi.b	#Button_B_Mask|Button_C_Mask, d2
	bne.s	loc_103FA
	rts
loc_103FA:
	move.b	#SFXID_Selection, (Sound_queue).w
	lea	(Window_name_input_string).w, a0
	move.w	(Window_name_input_cursor_pos).w, d0
	adda.w	d0, a0
	add.w	d0, d0
	addi.w	#$412C, d0
	lea	(InputCharacterMap).l, a1
	adda.w	(Window_options).w, a1
	moveq	#0, d1
	move.b	(a1), d1
	andi.b	#Button_B_Mask, d2
	bne.s	loc_10430
	cmpi.b	#$A3, d1
	beq.s	loc_1047A
	cmpi.b	#$A4, d1
	bne.s	loc_10432
loc_10430:
	moveq	#0, d1
loc_10432:
	cmpi.b	#$C4, d1
	beq.s	loc_10494
	move.b	d1, (a0)
	lea	(VDP_control_port).l, a2
	lea	(VDP_data_port).l, a3
	move.w	d1, d2
	add.w	d2, d2
	lea	(VDPCharacterMaps).l, a4
	adda.w	d2, a4
	move.w	#$8500, d3
	move	#$2700, sr
	move.w	d0, (a2)
	move.w	#3, (a2)
	move.b	(a4)+, d3
	move.w	d3, (a3)
	addi.w	#$80, d0
	move.w	d0, (a2)
	move.w	#3, (a2)
	move.b	(a4), d3
	move.w	d3, (a3)
	move	#$2500, sr
	tst.b	d1
	beq.s	loc_10488
loc_1047A:
	cmpi.w	#3, (Window_name_input_cursor_pos).w
	beq.s	loc_10492
	addq.w	#1, (Window_name_input_cursor_pos).w
	rts
loc_10488:
	tst.w	(Window_name_input_cursor_pos).w
	beq.s	loc_10492
	subq.w	#1, (Window_name_input_cursor_pos).w
loc_10492:
	rts
loc_10494:
	lea	($FFFFC63F).w, a0
	tst.b	(a0)
	bne.s	loc_104AC
	moveq	#3, d0
loc_1049E:
	tst.b	(a0)
	bne.s	loc_104A8
	subq.w	#1, a0
	dbf	d0, loc_1049E
loc_104A8:
	addq.w	#1, a0
	move.b	d1, (a0)
loc_104AC:
	move.w	#0, (Window_index).w
	move.w	#$8001, (Window_queue).w	; close one window
	rts
; --------------------------------------
; loc_104BA
Win_SaveSlots:
	tst.b	d1
	bne.s	loc_104CE
	btst	#1, (Window_queue).w
	beq.s	loc_104CC
	move.w	#0, (Window_index).w
loc_104CC:
	bra.s	loc_104EC
loc_104CE:
	subq.w	#1, d1
	bne.s	loc_104E2
	move.w	#3, d0
	move.w	#$170, d1
	move.w	#$118, d2
	bra.w	LoadCursorInWindows
loc_104E2:
	lea	($FFFFDEBC).w, a0
	moveq	#0, d1
	bra.w	loc_11028
loc_104EC:
	lea	($200701).l, a0
	lea	(Window_art_buffer+PlaneMap_WinSaveSlots-DynamicWindowsStart+$C).w, a1
	moveq	#3, d5
loc_104F8:
	moveq	#0, d3
	bsr.s	loc_1051C
	addq.w	#5, a1
	moveq	#1, d3
	bsr.s	loc_1051C
	move.b	(a2), d0
	lsl.w	#8, d0
	addq.w	#2, a2
	move.b	(a2), d0
	addq.w	#2, a2
	bsr.w	DrawDec2Digits
	addq.w	#3, a1
	adda.w	#$800, a0
	dbf	d5, loc_104F8
	rts
loc_1051C:
	movea.l	a0, a2
	move.w	#3, d2
loc_10522:
	moveq	#0, d1
	move.b	(a2), d1
	addq.w	#2, a2
	add.w	d1, d1
	add.w	d3, d1
	lea	(VDPCharacterMaps).l, a4
	adda.w	d1, a4
	move.b	(a4), (a1)+
	dbf	d2, loc_10522
	rts
; ----------------------------------------
; loc_1053C
Win_LibraryOptions:
	tst.b	d1
	bne.s	loc_10542
	rts
loc_10542:
	subq.w	#1, d1
	bne.s	loc_10556
	move.w	#4, d0
	move.w	#$140, d1
	move.w	#$A8, d2
	bra.w	LoadCursorInWindows
loc_10556:
	lea	($FFFFDEBE).w, a0
	moveq	#0, d1
	bra.w	loc_11028
; ------------------------------------
; loc_10560
Win_HealCure:
	tst.b	d1
	bne.s	loc_10566
	rts
loc_10566:
	subq.w	#1, d1
	bne.s	loc_1057A
	move.w	#1, d0
	move.w	#$F0, d1
	move.w	#$B8, d2
	bra.w	LoadCursorInWindows
loc_1057A:
	lea	($FFFFDEC0).w, a0
	moveq	#0, d1
	bra.w	loc_11028
; ----------------------------------------
; loc_10584
Win_StoreInventory:
	tst.b	d1
	beq.s	loc_105C6
	subq.w	#1, d1
	bne.s	loc_1059C
	move.w	($FFFFF764).w, d0
	move.w	#$F0, d1
	move.w	#$C0, d2
	bra.w	LoadCursorInWindows
loc_1059C:
	lea	($FFFFDEC2).w, a0
	moveq	#0, d1
	bsr.w	loc_11028
	lea	(StoreEquipItemArray).l, a2
	move.w	($FFFFF766).w, d1
	mulu.w	#6, d1
	adda.w	d1, a2
	adda.w	($FFFFDEC2).w, a2
	move.b	(a2), d0
	andi.b	#$7F, d0
	move.b	d0, (Item_index).w
	rts
loc_105C6:
	lea	(StoreEquipItemArray).l, a0
	move.w	($FFFFF766).w, d1
	mulu.w	#6, d1
	adda.w	d1, a0
	lea	(Window_art_buffer+PlaneMap_WinStoreInventory-DynamicWindowsStart+$14).w, a1
	moveq	#5, d5
loc_105DC:
	move.b	(a0), d1
	moveq	#0, d3
	bsr.w	loc_F95A
	addq.w	#8, a1
	move.b	(a0), d1
	moveq	#1, d3
	bsr.w	loc_F95A
	moveq	#0, d0
	move.b	(a0), d0
	lsl.w	#4, d0
	lea	(InventoryData+$A).l, a2
	adda.w	d0, a2
	move.w	(a2), d0
	bsr.w	CheckIfDoublePrice
	lea	(DecimalDigitData+8).l, a2
	moveq	#5, d1	; six digits
	bsr.w	DrawDecimalNumber2
	addq.w	#2, a1
	addq.w	#1, a0
	dbf	d5, loc_105DC

	rts
; -------------------------------------
; loc_10618
Win_RolfHouseOptions:
	tst.b	d1
	bne.s	loc_1061E
	rts
loc_1061E:
	subq.w	#1, d1
	bne.s	loc_10632
	move.w	#2, d0
	move.w	#$E8, d1
	move.w	#$98, d2
	bra.w	LoadCursorInWindows
loc_10632:
	bsr.w	loc_11010
	tst.w	(Window_index).w
	bne.s	loc_1064C
	btst	#4, d0
	bne.s	loc_1064E
	moveq	#0, d1
	move.b	(Window_current_option).w, d1
	move.w	d1, ($FFFFDEC4).w
loc_1064C:
	rts
loc_1064E:
	move.w	#2, ($FFFFDEC4).w
	move.w	#$8001, (Window_queue).w
	rts
; --------------------------------------
; loc_1065C
WinProfileCharList:
	tst.b	d1
	bne.s	loc_10662
	bra.s	loc_10684
loc_10662:
	subq.w	#1, d1
	bne.s	loc_10676
	move.w	(Party_members_joined).w, d0
	move.w	#$D0, d1
	move.w	#$B8, d2
	bra.w	LoadCursorInWindows
loc_10676:
	lea	($FFFFDEC6).w, a0
	bsr.w	Win_GetInputCloseCurrent
	move.w	d1, (Character_index).w
	rts
loc_10684:
	lea	(Window_art_buffer+PlaneMap_WinProfileCharList-DynamicWindowsStart+8).w, a1
	move.w	(Party_members_joined).w, d0
	moveq	#0, d1
loc_1068E:
	lea	(Character_stats+name).w, a2
	move.w	d1, d2
	lsl.w	#6, d2
	adda.w	d2, a2
	move.l	(a2)+, (a1)	; WARNING: a1 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	addq.w	#6, a1
	move.l	(a2), (a1)
	addq.w	#6, a1
	addq.w	#1, d1
	dbf	d0, loc_1068E
	moveq	#6, d0
	sub.w	(Party_members_joined).w, d0
	bcs.s	loc_106C2
loc_106AE:
	move.l	#$26262626, (a1)
	addq.w	#6, a1
	move.l	#$26262626, (a1)
	addq.w	#6, a1
	dbf	d0, loc_106AE

loc_106C2:
	rts
; ------------------------------------------
; loc_106C4
Win_CharProfiles:
	bsr.w	loc_11010
	rts
; ------------------------------------------
; loc_106CA
Win_RegroupCharList:
	tst.b	d1
	bne.s	loc_106D0
	bra.s	loc_10728
loc_106D0:
	subq.w	#1, d1
	bne.s	loc_106E4
	move.w	($FFFFC602).w, d0
	move.w	#$90, d1
	move.w	#$A0, d2
	bra.w	LoadCursorInWindows
loc_106E4:
	lea	($FFFFDECA).w, a0
	move.w	#$8002, d1
	bsr.w	Win_GetInput
	btst	#Button_B, (Joypad_pressed).w
	beq.s	loc_106FE
	subq.w	#1, (Window_routine_3).w
	rts

loc_106FE:
	tst.w	(Window_index).w
	bne.s	loc_10726
	moveq	#-1, d0
loc_10706:
	addq.w	#1, d0
	cmpi.w	#1, d0
	beq.s	loc_10706
	lea	(Party_member_ID).w, a0
	cmp.w	(a0)+,d0
	beq.s	loc_10706
	cmp.w	(a0)+,d0
	beq.s	loc_10706
	cmp.w	(a0)+,d0
	beq.s	loc_10706
	dbf	d1, loc_10706

	move.w	d0, (Character_index).w
loc_10726:
	rts

loc_10728:
	lea	(PlaneMap_WinRegroupCharList).l, a3
	lea	(Window_art_buffer+PlaneMap_WinRegroupCharList-DynamicWindowsStart).w, a2
	move.w	#$14, d0
loc_10736:
	move.l	(a3)+, (a2)+	; WARNING: a2 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	dbf	d0, loc_10736
	move.w	#$FFFF, ($FFFFC602).w
	lea	(Window_art_buffer+PlaneMap_WinRegroupCharList-DynamicWindowsStart+8).w, a1
	move.w	(Party_members_joined).w, d0
	subq.w	#2, d0
	bcs.s	loc_1077C
	moveq	#2, d1
loc_10750:
	lea	(Party_member_ID).w, a0
	cmp.w	(a0)+, d1
	beq.s	loc_10776
	cmp.w	(a0)+, d1
	beq.s	loc_10776
	cmp.w	(a0)+, d1
	beq.s	loc_10776
	lea	(Character_stats+name).w, a2
	move.w	d1, d2
	lsl.w	#6, d2
	adda.w	d2, a2
	move.l	(a2)+, (a1)
	addq.w	#6, a1
	move.l	(a2), (a1)
	addq.w	#6, a1
	addq.w	#1, ($FFFFC602).w
loc_10776:
	addq.w	#1, d1
	dbf	d0, loc_10750
loc_1077C:
	rts
; ----------------------------------------------
; loc_1077E
Win_RegroupSelectedChar:
	move.w	#0, (Window_index).w
	lea	(Window_art_buffer+PlaneMap_WinRegroupSelectedChar-DynamicWindowsStart+4).w, a1
	lea	(PlaneMap_WinRegroupSelectedChar).l, a3
	lea	(Window_art_buffer+PlaneMap_WinRegroupSelectedChar-DynamicWindowsStart).w, a2
	move.w	#9, d0
loc_10796:
	move.l	(a3)+, (a2)+	; WARNING: a2 and a3 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	dbf	d0, loc_10796
	lea	(Party_member_ID).w, a0
	move.w	(Party_members_num).w, d0
	bmi.s	loc_107B8
loc_107A6:
	lea	(Character_stats+name).w, a2
	move.w	(a0)+, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.l	(a2)+, (a1)+
	move.l	(a2), (a1)+
	dbf	d0, loc_107A6
loc_107B8:
	rts
; ---------------------------------
; loc_107BA
Win_CentTowerOptions:
	move.w	#2, d0
	bra.s	loc_107C4

; loc_107C0
Win_CentTowerOptions2:
	move.w	#3, d0
loc_107C4:
	tst.b	d1
	bne.s	loc_107CA
	rts
loc_107CA:
	subq.w	#1, d1
	bne.s	loc_107DA
	move.w	#$150, d1
	move.w	#$C0, d2
	bra.w	LoadCursorInWindows
loc_107DA:
	lea	($FFFFDECE).w, a0
	moveq	#0, d1
	bra.w	loc_11028
; ----------------------------------
; loc_107E4
Win_GameSelect:
	tst.b	d1
	bne.s	loc_107EA
	rts
loc_107EA:
	subq.w	#1, d1
	bne.s	loc_107FE
	move.w	#2, d0
	move.w	#$C0, d1
	move.w	#$A8, d2
	bra.w	LoadCursorInWindows
loc_107FE:
	lea	($FFFFDED0).w, a0
	moveq	#0, d1
	bra.w	loc_11028
; ----------------------------------------
; loc_10808
Win_RoomOptions:
	tst.b	d1
	bne.s	loc_1080E
	rts
loc_1080E:
	subq.w	#1, d1
	bne.s	loc_10822
	move.w	#1, d0
	move.w	#$90, d1
	move.w	#$108, d2
	bra.w	LoadCursorInWindows
loc_10822:
	move.w	#4, (Window_routine_2).w
	lea	($FFFFDED2).w, a0
	moveq	#0, d1
	bra.w	loc_11028
; ----------------------------------------
; loc_10832
Win_RightLeft:
	tst.b	d1
	bne.s	loc_10838
	rts
loc_10838:
	move.w	#1, (Refresh_stats_flag).w
	subq.w	#1, d1
	bne.s	loc_10852
	move.w	#1, d0
	move.w	#$F8, d1
	move.w	#$D8, d2
	bra.w	LoadCursorInWindows
loc_10852:
	lea	($FFFFDED4).w, a0
	bsr.w	Win_GetInputCloseCurrent
	andi.b	#$20, d0
	beq.s	loc_1086C
	move.w	#$8001, (Window_queue).w
	addq.w	#2, d1
	move.w	d1, ($FFFFDE6C).w
loc_1086C:
	rts
; ----------------------------------------
; loc_1086E
Win_StrngCharList:
	tst.b	d1
	bne.s	loc_10886
	move.l	(Party_member_ID).w, ($FFFFC618).w
	move.l	($FFFFC60C).w, ($FFFFC61C).w
	lea	(Window_art_buffer+PlaneMap_WinCharList2-DynamicWindowsStart+8).w, a1
	bra.w	loc_FE10
loc_10886:
	subq.w	#1, d1
	bne.s	loc_1089A
	move.w	(Party_members_num).w, d0
	move.w	#$A0, d1
	move.w	#$E8, d2
	bra.w	LoadCursorInWindows
loc_1089A:
	lea	($FFFFDE9A).w, a0
	bsr.w	Win_GetInputCloseCurrent
	lea	(Party_member_ID).w, a0
	add.w	d1, d1
	adda.w	d1, a0
	move.w	(a0), (Character_index).w
	rts
; --------------------------------------
; loc_108B0
Win_StoreCharList:
	tst.b	d1
	bne.s	loc_108C8
	move.l	(Party_member_ID).w, ($FFFFC618).w
	move.l	($FFFFC60C).w, ($FFFFC61C).w
	lea	(Window_art_buffer+PlaneMap_WinCharList2-DynamicWindowsStart+8).w, a1
	bra.w	loc_FE10
loc_108C8:
	subq.w	#1, d1
	bne.s	loc_108DC
	move.w	($FFFFDE9A).w, d0
	move.w	#$168, d1
	move.w	#$C8, d2
	bra.w	LoadCursorInWindows
loc_108DC:
	lea	($FFFFDE9A).w, a0
	moveq	#0, d1
	bsr.w	loc_11028
	lea	($FFFFC618).w, a0
	add.w	d1, d1
	adda.w	d1, a0
	move.w	(a0), (Character_index).w
	rts
; ----------------------------------------
; loc_108F4
Win_RolfPortrait:
	tst.b	d1
	bne.s	loc_10900
	move.w	#$A400, (Window_art_tile_start).w
	rts
loc_10900:
	move.w	#$8500, (Window_art_tile_start).w
	move.w	#0, (Window_index).w
	rts
; ----------------------------------------
; loc_1090E
Win_Portraits:
	tst.b	d1
	bne.s	loc_1091A
	move.w	#$C400, (Window_art_tile_start).w
	rts
loc_1091A:
	move.w	#$8500, (Window_art_tile_start).w
	move.w	#0, (Window_index).w
	rts
; ---------------------------------------
; loc_10928
Win_BattleFirstCharStats:
	move.w	(Party_member_ID).w, d1
	moveq	#0, d0
	bra.s	loc_10946
; -----------------------------------
; loc_10930
Win_BattleSecondCharStats:
	move.w	(Party_member_ID+2).w, d1
	moveq	#1, d0
	bra.s	loc_10946
; -----------------------------------
; loc_10938
Win_BattleThirdCharStats:
	move.w	(Party_member_ID+4).w, d1
	moveq	#2, d0
	bra.s	loc_10946
; -----------------------------------
; loc_10940
Win_BattleFourthCharStats:
	move.w	(Party_member_ID+6).w, d1
	moveq	#3, d0

loc_10946:
	move.w	#0, (Window_index).w
	cmp.w	(Party_members_num).w, d0
	bls.s	loc_1095A
	addi.w	#WinID_BattleEmptySpots-WinID_BattleCharStats, (Window_queue).w
	rts
loc_1095A:
	lea	(Char_battle_commands).w, a1
	move.w	d1, d0
	lsl.w	#4, d0
	adda.w	d0, a1
	move.w	(a1), d5
	if revision=0
	lea	(Window_art_buffer+PlaneMap_WinBattleCharStats-DynamicWindowsStart).w, a1
	else
	lea	(Window_art_buffer+PlaneMap_WinBattleCharStats-DynamicWindowsStart+6).w, a1
	endif
	lea	(Character_stats+curr_hp).w, a3
	lsl.w	#6, d1
	adda.w	d1, a3
	lea	(loc_114EA).l, a2
	tst.w	(a3)
	beq.s	loc_1099C
	addq.w	#4, a2
	subq.w	#2, a3
	move.w	(a3)+, d0
	btst	#$E, d0
	bne.s	loc_1099C
	addq.w	#4, a2
	btst	#4, d0
	bne.s	loc_10994
	tst.b	d0
	bne.s	loc_1099C
loc_10994:
	addq.w	#4, a2
	tst.w	d0
	bmi.s	loc_1099C
	addq.w	#4, a2
loc_1099C:
	move.w	(a2)+, (a1)+
	addq.w	#4, a1
	move.w	(a2)+, (a1)
	if revision=0
	addq.w	#3, a1
	else
	subq.w	#3, a1
	endif
	move.w	(a3), d0
	bsr.w	DrawDec3Digits
	addq.w	#4, a3
	addq.w	#3, a1
	move.w	(a3), d0
	bsr.w	DrawDec3Digits
	lea	(loc_114DA).l, a2
	lsl.w	#2, d5
	adda.w	d5, a2
	move.w	(a2)+, (a1)+
	addq.w	#4, a1
	move.w	(a2), (a1)+
	adda.w	#$32, a3
	subq.w	#6, a1
	move.l	(a3)+, (a1)+
	addq.w	#2, a1
	move.l	(a3)+, (a1)
	rts
; ---------------------------------
; loc_109D2
Win_BattleOptions:
	tst.b	d1
	bne.s	loc_109D8
	rts
loc_109D8:
	subq.w	#1, d1
	bne.s	loc_10A06
	lea	(Object_RAM).w, a0
	move.w	(Windows_opened_num).w, d3
	lsl.w	#6, d3
	adda.w	d3, a0
	move.w	#ObjID_BattleCursor, (a0)
	move.w	#0, $22(a0)
	move.w	#1, $32(a0)
	move.w	#$118, $A(a0)
	move.w	#$130, $E(a0)
	rts
loc_10A06:
	move.b	(Joypad_pressed).w, d0
	andi.b	#Button_C_Mask, d0
	beq.s	loc_10A26
	move.b	#SFXID_Selection, (Sound_queue).w
	lea	(Battle_option_index).w, a0
	moveq	#0, d1
	move.w	d1, (Window_index).w
	move.b	(Window_current_option).w, d1
	move.w	d1, (a0)
loc_10A26:
	rts

; ---------------------------------------
; loc_10A28
Win_BattleOptions2:
	tst.b	d1
	bne.s	loc_10A2E
	rts

loc_10A2E:
	subq.w	#1, d1
	bne.s	loc_10A5C
	lea	(Object_RAM).w, a0
	move.w	(Windows_opened_num).w, d3
	lsl.w	#6, d3
	adda.w	d3, a0
	move.w	#ObjID_BattleCursor, (a0)
	move.w	#0, $22(a0)
	move.w	#1, $32(a0)
	move.w	#$118, $A(a0)
	move.w	#$130, $E(a0)
	rts
loc_10A5C:
	lea	(Battle_option_index_2).w, a0
	move.w	#0, d2
loc_10A64:
	move.b	(Joypad_pressed).w, d0
	andi.b	#Button_B_Mask|Button_C_Mask, d0
	beq.s	loc_10A8E
	move.b	#SFXID_Selection, (Sound_queue).w
	moveq	#0, d1
	move.w	d1, (Window_index).w
	move.b	(Window_current_option).w, d1
	move.w	d1, (a0)
	andi.b	#$10, d0
	beq.s	loc_10A8E
	move.w	d2, (Window_queue).w
	subq.w	#2, (Window_routine_2).w
loc_10A8E:
	rts
; -------------------------------------
; loc_10A90
Win_BattleCharName:
	move.w	#0, (Window_index).w
	lea	(Window_art_buffer+PlaneMap_WinBattleCharName-DynamicWindowsStart+4).w, a1
	lea	(Character_stats+name).w, a3
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a3
	move.l	(a3)+, (a1)+	; WARNING: a1 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	move.l	(a3), (a1)
	rts
; ------------------------------------
; loc_10AAC
Win_BattleCommands:
	tst.b	d1
	bne.s	loc_10AB2
	rts
loc_10AB2:
	subq.w	#1, d1
	bne.s	loc_10AE2
	lea	(Object_RAM).w, a0
	move.w	(Windows_opened_num).w, d3
	subq.w	#1, d3
	lsl.w	#6, d3
	adda.w	d3, a0
	move.w	#ObjID_CommandSelectCursor, (a0)
	move.w	#0, $22(a0)
	move.w	#3, $32(a0)
	move.w	#$A8, $A(a0)
	move.w	#$118, $E(a0)
	rts
loc_10AE2:
	lea	(Battle_command_index).w, a0
	move.w	#$8402, d2
	bra.w	loc_10A64
; --------------------------
; loc_10AEE
Win_EnemyGroups:
	tst.b	d1
	beq.s	loc_10B2A
	subq.w	#1, d1
	bne.s	loc_10B06
	move.w	#1, d0
	move.w	#$140, d1
	move.w	#$108, d2
	bra.w	LoadCursorInWindows
loc_10B06:
	lea	($FFFFDEE4).w, a0
	move.w	#$8003, d2
	tst.w	(Battle_command_index).w
	beq.s	loc_10B16
	addq.w	#1, d2
loc_10B16:
	moveq	#0, d1
	bsr.w	loc_10A64
	tst.w	d1
	beq.s	loc_10B24
	move.w	(Enemy_group_2_start_num).w, d1
loc_10B24:
	move.w	d1, (Character_index_2).w
	rts
loc_10B2A:
	lea	(Window_art_buffer+PlaneMap_WinEnemyGroups-DynamicWindowsStart+$E).w, a1
	move.w	(Enemy_1).w, d0
	bsr.s	loc_10B38
	move.w	(Enemy_2).w, d0
loc_10B38:
	moveq	#0, d3
	bsr.w	loc_10E8E
	addq.w	#2, a1
	moveq	#1, d3
	bsr.w	loc_10E8E
	addq.w	#2, a1
	rts
; --------------------------
; loc_10B4A
Win_BattleMessage:
	tst.b	d1
	bne.s	loc_10B56
	move.w	#$8500, (Window_art_tile_start).w
	rts
loc_10B56:
	subq.w	#1, d1
	bne.s	loc_10BA4
	lea	(Window_draw_cache).w, a0
	move.w	(Windows_opened_num).w, d0
	subq.w	#1, d0
	lsl.w	#4, d0
	adda.w	d0, a0
	move.w	(a0), d0
	move.b	d0, d6
	andi.b	#$80, d6
	addq.b	#2, d0
	andi.b	#$7F, d0
	or.b	d6, d0
	addi.w	#$80, d0
	andi.w	#$CFFF, d0
	move.w	d0, (Text_plane_offset).w
	move.w	d0, (Text_plane_offset_start).w
	bsr.w	CheckLoadScript
	move.w	#0, (Text_curr_line).w
	move.w	#0, (Text_max_line_num).w
	move.w	#0, (Text_line_scroll_speed).w
	move.w	#$3C, (Text_auto_timer).w
loc_10BA4:
	move.w	#0, (Window_index).w
	rts
; -------------------------------------
; loc_10BAC
Win_BattleTechList:
	tst.b	d1
	bne.s	loc_10BE0
	bsr.w	loc_112C4
	lea	(loc_1144A).l, a3
	lea	(Character_stats+battle_tech_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.b	(a2), d0
	andi.w	#$1F, d0
	cmpi.b	#5, d0
	bcs.s	loc_10BD4
	addq.w	#6, a3
loc_10BD4:
	lea	($FFFFC810).w, a2
	adda.w	($FFFFDEEC).w, a2
	bra.w	loc_10CBE
loc_10BE0:
	subq.w	#1, d1
	bne.s	loc_10C22
	lea	(Character_stats+battle_tech_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.b	(a2), d0
	andi.w	#$1F, d0
	move.w	#$108, d2
	subq.w	#1, d0
	cmpi.b	#4, d0
	bcs.s	loc_10C1A
	move.w	#$F8, d2
	sub.w	($FFFFDEEC).w, d0
	cmpi.b	#4, d0
	bcc.s	loc_10C16
	addi.w	#$101, d0
	bra.s	loc_10C1A
loc_10C16:
	move.w	#$104, d0
loc_10C1A:
	move.w	#$C8, d1
	bra.w	LoadCursorInWindows
loc_10C22:
	lea	($FFFFDE9C).w, a0
	move.b	(Joypad_pressed).w, d0
	andi.b	#Button_B_Mask|Button_C_Mask, d0
	beq.w	loc_10CBC
	move.b	#SFXID_Selection, (Sound_queue).w
	moveq	#0, d1
	move.w	d1, (Window_index).w
	move.b	(Window_current_option).w, d1
	move.w	d1, (a0)
	andi.b	#$10, d0
	beq.s	loc_10C5E
	move.w	#$8001, (Window_queue).w
	move.w	#WinID_BattleCommands, (Window_index).w
	move.w	#0, (Window_routine_4).w
	rts
loc_10C5E:
	tst.w	($FFFFDEEC).w
	bne.s	loc_10C6C
	cmpi.b	#4, ($FFFFDE51).w
	bne.s	loc_10C9E
loc_10C6C:
	tst.w	d1
	bne.s	loc_10C9A
	move.w	#((6<<8)|WinID_BattleTechList), (Window_queue).w
	lea	(Character_stats+battle_tech_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.b	(a2), d0
	andi.w	#$1F, d0
	addq.w	#4, ($FFFFDEEC).w
	cmp.w	($FFFFDEEC).w, d0
	bhi.s	+
	move.w	#0, ($FFFFDEEC).w
+
	rts
loc_10C9A:
	subq.w	#1, ($FFFFDE9C).w
loc_10C9E:
	lea	($FFFFC810).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#5, d1
	adda.w	d1, a2
	adda.w	($FFFFDE9C).w, a2
	adda.w	($FFFFDEEC).w, a2
	move.b	(a2), d0
	andi.b	#$3F, d0
	move.b	d0, (Technique_index).w
loc_10CBC:
	rts
loc_10CBE:
	move.w	(Character_index).w, d1
	lsl.w	#5, d1
	adda.w	d1, a2
	lea	(Window_art_buffer+PlaneMap_WinBattleTechList-DynamicWindowsStart).w, a1
	move.l	(a3)+, (a1)+	; WARNING: a1 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	move.w	(a3), (a1)+
	addq.w	#1, a1
	move.w	#3, d0
loc_10CD4:
	moveq	#0, d3
	bsr.w	loc_FF18
	moveq	#1, d3
	bsr.w	loc_FF18
	addq.w	#1, a2
	dbf	d0, loc_10CD4
	rts
; ----------------------------
; loc_10CE8
Win_BattleItemList:
	tst.b	d1
	bne.s	loc_10D14
	lea	(loc_1141A).l, a3
	lea	(Character_stats+item_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.b	(a2), d0
	cmpi.b	#5, d0
	bcs.s	loc_10D08
	addq.w	#8, a3
loc_10D08:
	lea	(Character_stats+items).w, a2
	adda.w	($FFFFDEEE).w, a2
	bra.w	loc_10DF0
loc_10D14:
	subq.w	#1, d1
	bne.s	loc_10D54
	lea	(Character_stats+item_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	moveq	#0, d0
	move.b	(a2), d0
	move.w	#$108, d2
	subq.w	#1, d0
	cmpi.b	#4, d0
	bcs.s	loc_10D4C
	move.w	#$F8, d2
	sub.w	($FFFFDEEE).w, d0
	cmpi.b	#4, d0
	bcc.s	loc_10D48
	addi.w	#$101, d0
	bra.s	loc_10D4C
loc_10D48:
	move.w	#$104, d0
loc_10D4C:
	move.w	#$A0, d1
	bra.w	LoadCursorInWindows
loc_10D54:
	lea	(Inventory_offset).w, a0
	move.b	(Joypad_pressed).w, d0
	andi.b	#Button_B_Mask|Button_C_Mask, d0
	beq.w	loc_10DEE
	move.b	#SFXID_Selection, (Sound_queue).w
	moveq	#0, d1
	move.w	d1, (Window_index).w
	move.b	(Window_current_option).w, d1
	move.w	d1, (a0)
	andi.b	#$10, d0
	beq.s	loc_10D90
	move.w	#$8001, (Window_queue).w
	move.w	#WinID_BattleCommands, (Window_index).w
	move.w	#0, (Window_routine_4).w
	rts
loc_10D90:
	tst.w	($FFFFDEEE).w
	bne.s	loc_10D9E
	cmpi.b	#4, ($FFFFDE51).w
	bne.s	loc_10DD0
loc_10D9E:
	tst.w	d1
	bne.s	loc_10DCC
	move.w	#((6<<8)|WinID_BattleItemList), (Window_queue).w
	lea	(Character_stats+item_num).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	move.b	(a2), d0
	andi.w	#$1F, d0
	addq.w	#4, ($FFFFDEEE).w
	cmp.w	($FFFFDEEE).w, d0
	bhi.s	loc_10DCA
	move.w	#0, ($FFFFDEEE).w
loc_10DCA:
	rts
loc_10DCC:
	subq.w	#1, (Inventory_offset).w
loc_10DD0:
	lea	(Character_stats+items).w, a2
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	adda.w	(Inventory_offset).w, a2
	adda.w	($FFFFDEEE).w, a2
	move.b	(a2), d0
	andi.b	#$7F, d0
	move.b	d0, (Item_index).w
loc_10DEE:
	rts
loc_10DF0:
	move.w	(Character_index).w, d1
	lsl.w	#6, d1
	adda.w	d1, a2
	lea	(Window_art_buffer+PlaneMap_WinBattleItemList-DynamicWindowsStart).w, a1
	move.l	(a3)+, (a1)+	; WARNING: a1 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	move.l	(a3), (a1)+
	addq.w	#5, a1
	move.w	#3, d0
loc_10E06:
	moveq	#0, d3
	bsr.w	loc_F948
	moveq	#1, d3
	bsr.w	loc_F948
	addq.w	#1, a2
	dbf	d0, loc_10E06
	rts
; -----------------------------------
; loc_10E1A
Win_BattleItemUsed:
	move.w	#0, (Window_index).w
	lea	(Window_art_buffer+PlaneMap_WinBattleItemUsed-DynamicWindowsStart+$A).w, a1
	move.b	(Item_index).w, d1
	moveq	#0, d3
	bsr.w	loc_F95A
	move.b	(Item_index).w, d1
	moveq	#1, d3
	bra.w	loc_F95A
; -------------------------------
; loc_10E38
Win_BattleTechUsed:
	move.w	#0, (Window_index).w
	lea	(Window_art_buffer+PlaneMap_WinBattleTechUsed-DynamicWindowsStart+5).w, a1
	move.b	(Technique_index).w, d1
	moveq	#0, d3
	bsr.w	loc_FF1C
	move.b	(Technique_index).w, d1
	moveq	#1, d3
	bra.w	loc_FF1C
; ---------------------------
; loc_10E56
Win_BattleEmptySpots:
	move.w	#0, (Window_index).w
	rts
; ----------------------------------------
; loc_10E5E
Win_FirstEnemyName:
	move.w	(Enemy_1).w, d0		; enemy name (first group)
	bra.s	loc_10E68
Win_SecondEnemyName:
	move.w	(Enemy_2).w, d0		; enemy name (second group)
loc_10E68:
	tst.b	d1
	bne.s	loc_10E80
	move.w	#$500, (Window_art_tile_start).w
	lea	(Window_art_buffer+PlaneMap_WinEnemyNames-DynamicWindowsStart+$A).w, a1
	moveq	#0, d3
	bsr.s	loc_10E8E
	moveq	#1, d3
	bsr.s	loc_10E8E
	rts
loc_10E80:
	move.w	#$8500, (Window_art_tile_start).w
	move.w	#0, (Window_index).w
	rts
loc_10E8E:
	lea	(EnemyNames).l, a3
	move.w	d0, d1
	mulu.w	#$A, d1
	adda.w	d1, a3
	move.w	#9, d2
loc_10EA0:
	moveq	#0, d1
	move.b	(a3)+, d1
	add.w	d1, d1
	add.w	d3, d1
	lea	(VDPCharacterMaps).l, a4
	adda.w	d1, a4
	move.b	(a4), (a1)+
	dbf	d2, loc_10EA0

	rts
; -------------------------------
; loc_10EB8
Win_FirstEnemyInfo:
	move.w	(Enemy_damage_1).w, d0
	bra.s	loc_10EC2
; loc_10EBE
Win_SecondEnemyInfo:
	move.w	(Enemy_damage_2).w, d0
loc_10EC2:
	tst.b	d1
	beq.s	loc_10ED4
	move.w	#$8500, (Window_art_tile_start).w
	move.w	#0, (Window_index).w
	rts
loc_10ED4:
	move.w	#$500, (Window_art_tile_start).w
	lea	(Window_art_buffer+PlaneMap_WinEnemyInfo-DynamicWindowsStart+4).w, a1
	lea	(loc_114FE).l, a3
	tst.w	d0
	bmi.s	loc_10EF0
	bclr	#$E, d0
	beq.s	loc_10EF0
	addq.w	#4, a3
loc_10EF0:
	move.l	(a3), (a1)+	; WARNING: a1 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	lea	(loc_11506).l, a3
	tst.w	d0
	beq.s	loc_10F02
	bpl.w	DrawDec4Digits
	addq.w	#4, a3
loc_10F02:
	move.l	(a3), (a1)+
	rts
; ----------------------------------------
; loc_10F06
Win_TeleportPlaceNames:
	tst.b	d1
	beq.s	loc_10F2A
	subq.w	#1, d1
	bne.s	loc_10F1E
	move.w	($FFFFDED6).w, d0
	move.w	#$118, d1
	move.w	#$C8, d2
	bra.w	LoadCursorInWindows
loc_10F1E:
	lea	($FFFFDED6).w, a0
	moveq	#0, d1
	bsr.w	loc_11028
	rts
loc_10F2A:
	lea	(PlaneMap_WinTeleportPlaceNames).l, a1
	lea	(Window_art_buffer+PlaneMap_WinTeleportPlaceNames-DynamicWindowsStart).w, a2
	move.w	#$14, d0
loc_10F38:
	move.l	(a1)+, (a2)+	; WARNING: a1 and a2 can point to an odd address if the dynamic windows are resized. Split the move.l into multiple move.b instructions and change the code accordingly
	dbf	d0, loc_10F38

	lea	(Window_art_buffer+PlaneMap_WinTeleportPlaceNames-DynamicWindowsStart+9).w, a1
	lea	($FFFFF768).w, a3
	move.w	#$FFFF, ($FFFFDED6).w
	moveq	#5, d2
	lea	($FFFFC704).w, a2
	tst.w	($FFFFF764).w
	beq.s	loc_10F62
	lea	($FFFFC70A).w, a2
	moveq	#3, d0
	moveq	#3, d2
	bra.s	loc_10F6E
loc_10F62:
	move.b	(a2)+, d0
	beq.s	loc_10F80
	ext.w	d0
	cmp.w	(Map_index).w, d0
	beq.s	loc_10F80
loc_10F6E:
	move.b	d0, (a3)+
	move.w	d0, d1
	moveq	#0, d3
	bsr.s	loc_10F86
	move.w	d0, d1
	moveq	#1, d3
	bsr.s	loc_10F86
	addq.w	#1, ($FFFFDED6).w
loc_10F80:
	dbf	d2, loc_10F62
	rts
loc_10F86:
	lea	(TeleportPlaceNamesArray-$F).l, a0
	mulu.w	#5, d1
	adda.w	d1, a0
	moveq	#4, d5
loc_10F94:
	moveq	#0, d1
	move.b	(a0)+, d1
	add.w	d1, d1
	add.w	d3, d1
	lea	(VDPCharacterMaps).l, a4
	adda.w	d1, a4
	move.b	(a4), (a1)+
	dbf	d5, loc_10F94

	addq.w	#2, a1
	rts
; ----------------------------------------