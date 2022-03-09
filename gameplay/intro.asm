IntroScr_CheckRoutine:
	tst.w	(Window_queue).w
	bne.s	+
	tst.w	(Window_index).w
	bne.s	+
	tst.w	(Script_flag).w
	bne.s	+
	move.w	(Window_routine_2).w, d1
	bne.s	Intro_RunRoutine
	move.b	#GameModeID_Title, (Game_mode_index).w
+
	rts

Intro_RunRoutine:
	move.w	(Scene_index).w, d0
	lsl.w	#2, d0
	andi.w	#4, d0
	jmp	IntroScr_EventIndex(pc,d0.w)
; --------------------------------------------------------
IntroScr_EventIndex:
	bra.w	Intro_EventSelectGame
	bra.w	Intro_EventStartGame
; --------------------------------------------------------
Intro_EventSelectGame:
	lsl.w	#2, d1
	andi.w	#$7C, d1
	jmp	SelectGameState-4(pc,d1.w)
; --------------------------------------------
SelectGameState:
	bra.w	SelectGame_CheckSaves
	bra.w	loc_D2B6
	bra.w	loc_D2C2
	bra.w	loc_D2F2
	bra.w	loc_D324
	bra.w	loc_D330
	bra.w	loc_D362
	bra.w	loc_D36E
	bra.w	loc_D384
	bra.w	loc_D392
	bra.w	loc_D3AA
	bra.w	loc_D3B6
	bra.w	loc_D43A
	bra.w	loc_D44C
	bra.w	loc_D458
	bra.w	loc_D4B8
	bra.w	loc_D4C4
	bra.w	loc_D4EA
; --------------------------------------------
SelectGame_CheckSaves:
	move.w	(Window_routine_4).w, d1
	lsl.w	#2, d1
	andi.w	#$C, d1
	jmp	loc_D1D0(pc,d1.w)

loc_D1D0:
	bra.w	loc_D1E0
	bra.w	loc_D20E
	bra.w	loc_D298
	bra.w	loc_D2A4

loc_D1E0:
	tst.w	($FFFFFF00).w
	bne.s	loc_D208
	bsr.w	loc_D700
	move.w	#1, ($FFFFFF00).w		; make sure this part (check game save slots) is run only once (usually when you return to the intro screen by soft reset, game over, etc...)
	move.w	#WinID_ScriptMessage2, (Window_queue).w
	;move.w	#$130B, (Script_queue).w		; "Let me check the backup data."
	move.w	#0, ($FFFFC602).w
	addq.w	#1, (Window_routine_4).w
	rts

loc_D208:
	addq.w	#1, (Window_routine_2).w
	rts

loc_D20E:
	move.w	($FFFFC602).w, d0
	ext.l	d0
	move.l	d0, (Meseta_value).w
	addq.l	#1, (Meseta_value).w
	move.w	d0, d1
	lea	($200739).l, a0
	lsl.w	#8, d1
	lsl.w	#3, d1
	adda.w	d1, a0
	tst.b	(a0)
	bne.s	loc_D234
	tst.b	$2000(a0)
	beq.s	loc_D252
loc_D234:
	move.w	#$130D, (Script_queue).w ; There is a problem with
	bsr.w	loc_D676
	bne.s	loc_D264
	move.w	($FFFFC602).w, d0
	addq.w	#4, d0
	bsr.w	loc_D676
	bne.s	loc_D280
	move.w	#$130C, (Script_queue).w ; "The data for ", $C0, " is ok."
loc_D252:
	addq.w	#1, ($FFFFC602).w
	cmpi.w	#4, ($FFFFC602).w
	bne.s	loc_D262
	addq.w	#1, (Window_routine_4).w
loc_D262:
	rts
loc_D264:
	move.w	($FFFFC602).w, d0
	addq.w	#4, d0
	bsr.w	loc_D676
	beq.s	loc_D288
	move.w	#$130F, ($FFFFCD02).w
	move.w	($FFFFC602).w, d5
	bsr.w	SaveData
	bra.s	loc_D252
loc_D280:
	move.w	($FFFFC602).w, d0
	addq.w	#4, d0
	bra.s	loc_D28C
loc_D288:
	move.w	($FFFFC602).w, d0
loc_D28C:
	bsr.w	loc_D6D4
	move.w	#$130E, ($FFFFCD02).w
	bra.s	loc_D252
loc_D298:
	move.w	#$1310, (Script_queue).w ; Data check complete.
	addq.w	#1, (Window_routine_4).w
	rts
loc_D2A4:
	move.w	#0, (Window_routine_4).w
	addq.w	#1, (Window_routine_2).w
	move.w	#$8001, (Window_queue).w
	rts

loc_D2B6:
	move.w	#WinID_GameSelect, (Window_queue).w		; NEW GAME, CONTINUE GAME, ERASE GAME window
	addq.w	#1, (Window_routine_2).w
	rts

loc_D2C2:
	tst.w	(Window_routine_3).w
	bne.w	loc_D2EA
	move.w	#0, (Window_routine_4).w
	move.w	($FFFFDED0).w, d0
	bne.s	loc_D2DC
	addq.w	#1, (Window_routine_2).w
	rts
loc_D2DC:
	subq.w	#1, d0
	beq.s	loc_D2E4
	addq.w	#3, (Window_routine_2).w
loc_D2E4:
	addq.w	#7, (Window_routine_2).w
	rts
loc_D2EA:
	move.b	#GameModeID_Title, (Game_mode_index).w
	rts
loc_D2F2:
	move.w	#WinID_ScriptMessage2, (Window_queue).w
	lea	($200739).l, a0
	moveq	#3, d0
loc_D300:
	tst.b	(a0)
	beq.s	loc_D318
	adda.w	#$800, a0
	dbf	d0, loc_D300
	move.w	#$1301, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D318:
	move.w	#$1302, (Script_queue).w
	addq.w	#3, (Window_routine_2).w
	rts
loc_D324:
	move.w	#WinID_YesNo2, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D330:
	move.w	(Window_routine_4).w, d1
	bne.s	loc_D354
	move.w	(Yes_no_input).w, d0
	beq.s	loc_D348
	move.w	#$1303, (Script_queue).w
	addq.w	#1, (Window_routine_4).w
	rts
loc_D348:
	move.w	#$1302, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D354:
	move.w	#0, (Window_routine_4).w
	subq.w	#2, (Window_routine_2).w
	bra.w	Win_CloseCurrent
loc_D362:
	move.w	#WinID_NameInput, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D36E:
	move.w	#0, (Character_index).w
	bsr.w	loc_B36C
	move.w	#$1304, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D384:
	move.w	#SceneID_RolfHouse, (Scene_index).w
	move.w	#1, (Screen_changed_flag).w
	rts
loc_D392:
	move.w	#WinID_ScriptMessage2, (Window_queue).w
	move.w	#$1305, (Script_queue).w
	move.w	#0, (Window_routine_4).w
	addq.w	#1, (Window_routine_2).w
	rts

loc_D3AA:
	move.w	#WinID_SaveSlots, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts

loc_D3B6:
	tst.w	(Window_routine_3).w
	bne.w	loc_D42C
	move.w	(Window_routine_4).w, d1
	bne.s	loc_D41E
	move.w	($FFFFDEBC).w, d0
	lea	($200739).l, a0
	lsl.w	#8, d0
	lsl.w	#3, d0
	adda.w	d0, a0
	tst.b	(a0)
	beq.s	loc_D412
	move.w	($FFFFDEBC).w, d0
	bsr.w	LoadSavedData
	move.w	#SceneID_DataMemory, (Scene_index).w
	move.w	#9, (Portrait_index).w
	move.w	($FFFFC65C).w, ($FFFFF766).w
	tst.w	($FFFFF766).w
	bne.s	+
	tst.w	($FFFFC65A).w
	beq.s	+
	move.w	#$10, (Portrait_index).w
+
	move.w	#1, ($FFFFF764).w
	move.b	#GameModeID_Scene, (Game_mode_index).w
	rts
loc_D412:
	move.w	#$130A, (Script_queue).w		; "There is no data for that number. Enter a different number."
	addq.w	#1, (Window_routine_4).w
	rts
loc_D41E:
	move.w	#0, (Window_routine_4).w
	move.w	#WinID_SaveSlots, (Window_index).w
	rts
loc_D42C:
	subi.w	#9, (Window_routine_2).w
	move.w	#$8002, d1
	bra.w	Win_Close
loc_D43A:
	move.w	#WinID_ScriptMessage2, (Window_queue).w
	move.w	#$1306, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D44C:
	move.w	#WinID_SaveSlots, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D458:
	tst.w	(Window_routine_3).w
	bne.w	loc_D4AA
	move.w	(Window_routine_4).w, d1
	bne.s	loc_D41E
	move.w	($FFFFDEBC).w, d0
	ext.l	d0
	move.l	d0, (Meseta_value).w
	addq.l	#1, (Meseta_value).w
	lea	($200739).l, a0
	lsl.w	#8, d0
	lsl.w	#3, d0
	adda.w	d0, a0
	tst.b	(a0)
	beq.s	loc_D412
	move.w	#$1307, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D4AA:
	subi.w	#$C, (Window_routine_2).w
	move.w	#$8002, d1
	bra.w	Win_Close
loc_D4B8:
	move.w	#WinID_YesNo3, (Window_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D4C4:
	move.w	(Yes_no_input).w, d0
	beq.s	loc_D4D6
	move.w	#$1309, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D4D6:
	move.w	#$1308, (Script_queue).w
	move.w	($FFFFDEBC).w, d5
	bsr.w	SaveData
	addq.w	#1, (Window_routine_2).w
	rts
loc_D4EA:
	subi.w	#$E, (Window_routine_2).w
	move.w	#$8002, d1
	bra.w	Win_Close
; --------------------------------------------------------
Intro_EventStartGame:
	lsl.w	#2, d1
	andi.w	#$1C, d1
	jmp	loc_D502-4(pc,d1.w)
; ------------------------------------------
loc_D502:
	bra.w	loc_D516
	bra.w	loc_D534
	bra.w	loc_D572
	bra.w	loc_D59C
	bra.w	loc_D5EA
; ------------------------------------------
loc_D516:
	move.w	#WinID_ScriptMessageBig, (Window_queue).w
	move.w	#$1501, (Script_queue).w
	move.w	#0, (Character_index).w
	addq.w	#1, (Window_routine_2).w
	move.b	#$8F, d0
	bra.w	UpdateSoundQueue

loc_D534:
	lea	(loc_70A32).l, a1
	move.l	#$410C0003, d0
	moveq	#$1B, d1
	moveq	#$D, d2
	bsr.w	PlaneMapToVRAM
	lea	(RAM_start&$FFFFFF).l, a4
	lea	(loc_6D7BA).l, a0
	bsr.w	DecompressToRAM
	move.l	#$40200000, d0
	move.w	#$F9, d7
	bsr.w	ArtGradualFill
	move.w	#$1502, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D572:
	move.l	#$40200000, d0
	move.w	#$F9, d7
	bsr.w	ArtGradualClear
	lea	($FFFFFB60).w, a0
	moveq	#0, d0
	move.w	#$F, d1
loc_D58A:
	move.w	d0, (a0)+
	dbf	d1, loc_D58A
	move.w	#$1503, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D59C:
	move	#$2700, sr
	lea	(loc_71052).l, a1
	move.l	#$410C0003, d0
	moveq	#$1B, d1
	moveq	#$D, d2
	bsr.w	PlaneMapToVRAM
	move.l	#$40200000, (VDP_control_port).l
	lea	(loc_6FF22).l, a0
	bsr.w	DecompressToVDP
	move	#$2500, sr
	moveq	#PalID_GameStart, d0
	bsr.w	PaletteLoad1
	move.l	#$60000F, ($FFFFF626).w
	bsr.w	loc_61F4
	move.w	#$1504, (Script_queue).w
	addq.w	#1, (Window_routine_2).w
	rts
loc_D5EA:
	move.w	#SceneID_CentralTowerGovernor, (Scene_index).w
	move.w	#$17, (Portrait_index).w
	move.w	#1, (Cutscene_flag).w
	move.w	#0, (Cutscene_index).w
	move.w	#0, (Cutscene_input_frame).w
	move.w	#-1, (Screen_changed_flag).w
	rts
; ------------------------------------------