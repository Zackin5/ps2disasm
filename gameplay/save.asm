SaveData:
	move.w	d5, d0
	bsr.s	+
	move.w	d5, d0
	addq.w	#4, d0
+
	lea	($200001).l, a0
	lsl.w	#8, d0
	lsl.w	#3, d0
	adda.w	d0, a0
	moveq	#0, d3
	moveq	#0, d2
	lea	(Character_stats).w, a1
	move.w	#$1FF, d1		; 512 bytes for the characters' data
-
	move.b	(a1)+, d2
	move.b	d2, (a0)
	addq.w	#2, a0		; move to next odd address -- Save RAM data MUST be on odd addresses only
	add.w	d2, d3
	dbf	d1, -

	lea	(Town_flags).w, a1
	move.w	#$FF, d1
-
	move.b	(a1)+, d2
	move.b	d2, (a0)
	addq.w	#2, a0
	add.w	d2, d3
	dbf	d1, -

	lea	(Party_members_num).w, a1
	move.w	#$9D, d1
-
	move.b	(a1)+, d2
	move.b	d2, (a0)
	addq.w	#2, a0
	add.w	d2, d3
	dbf	d1, -

	lea	($FFFFC69E).w, a1
	move.w	d3, (a1)
	moveq	#$61, d1
-
	move.b	(a1)+, (a0)
	addq.w	#2, a0
	dbf	d1, -
	rts

loc_D676:
	lea	($200001).l, a0
	lsl.w	#8, d0
	lsl.w	#3, d0
	adda.w	d0, a0
	moveq	#0, d3
	moveq	#0, d2
	move.w	#$39D, d1
-
	move.b	(a0), d2
	addq.w	#2, a0
	add.w	d2, d3
	dbf	d1, -

	move.b	(a0), d1
	lsl.w	#8, d1
	addq.w	#2, a0
	move.b	(a0), d1
	addq.w	#2, a0
	cmp.w	d1, d3
	bne.s	loc_D6A6
	moveq	#0, d0
	rts
loc_D6A6:
	moveq	#-1, d0
	rts

loc_D6AA:
	lea	($200741).l, a0
	lsl.w	#8, d0
	lsl.w	#3, d0
	adda.w	d0, a0
	moveq	#0, d2
	lea	(CopyrightString).l, a1
	moveq	#$5F, d1
-
	move.b	(a0), d2
	addq.w	#2, a0
	cmp.b	(a1)+, d2
	bne.s	loc_D6D0
	dbf	d1, -

	moveq	#0, d0
	rts

loc_D6D0:
	moveq	#-1, d0
	rts

loc_D6D4:
	lea	($200001).l, a0
	move.w	d0, d1
	movea.l	a0, a1
	lsl.w	#8, d0
	lsl.w	#3, d0
	adda.w	d0, a0
	addq.w	#4, d1
	andi.w	#7, d1
	lsl.w	#8, d1
	lsl.w	#3, d1
	adda.w	d1, a1
	move.w	#$3FF, d1
loc_D6F4:
	move.b	(a1), (a0)
	addq.w	#2, a1
	addq.w	#2, a0
	dbf	d1, loc_D6F4

	rts

loc_D700:
	moveq	#0, d5
	moveq	#3, d6
loc_D704:
	move.w	d5, d0
	bsr.s	loc_D6AA
	beq.s	loc_D716
	move.w	d5, d0
	addq.w	#4, d0
	bsr.s	loc_D6AA
	beq.s	loc_D716
	bsr.w	SaveData

loc_D716:
	addq.w	#1, d5
	dbf	d6, loc_D704
	rts

LoadSavedData:
	lea	($200001).l, a0
	lsl.w	#8, d0
	lsl.w	#3, d0
	adda.w	d0, a0
	moveq	#0, d3
	lea	(Character_stats).w, a1
	move.w	#$1FF, d1
-
	move.b	(a0), (a1)+
	addq.w	#2, a0
	dbf	d1, -

	lea	(Town_flags).w, a1
	move.w	#$FF, d1
-
	move.b	(a0), (a1)+
	addq.w	#2, a0
	dbf	d1, -

	lea	(Party_members_num).w, a1
	move.w	#$FF, d1
-
	move.b	(a0), (a1)+
	addq.w	#2, a0
	dbf	d1, -
	rts

; ==============================================
; Character arrays of copyright message
CopyrightString:
	dc.b	"SEGA MEGA DRIVE "
	dc.b	"(C)SEGA 1988.NOV"
	dc.b	"PHANTASY STAR 2       "
	dc.b	"BACKUP RAM"
	dc.b	"PROGRAMMED BY          "
	dc.b	"NAKA YUJI"
; ==============================================