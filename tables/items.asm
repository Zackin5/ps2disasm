; =======================================================================
; All inventory data
; 16 bytes for every item
;
; bytes 1-10 = name of the item
; bytes 11 and 12 = price
; byte 13 = bitfield - determines allowed actions for items
; 				lower 3 bits = body part to wear item:
;					1 = head
;					2 = one-handed weapon
;					3 = two-handed weapon
;					4 = body
;					5 = feet
; 				bit 3 = usable in map flag
;				bit 4 = usable in battle flag
;				bit 5 = storable flag
;				bit 6 = revert to attack after usage
;				bit 7 = sellable/disposable flag
; byte 14 = bitfield - determines which character can equip the item
; byte 15 = attack value
; byte 16 = defense value
; =======================================================================
InventoryData:

	if revision=0
Item_None:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Item_SmallKey:
	dc.b	$1B, $0C, $15, $1F, $10, $3E, $C4, $00, $00, $00, $00, $00, $28, $00, $00, $00

Item_Dynamite:
	dc.b	$96, $57, $6A, $73, $57, $69, $C4, $00, $00, $00, $00, $00, $48, $00, $00, $00

Item_KeyTube:
	dc.b	$5C, $A5, $66, $8A, $A5, $9D, $C4, $00, $00, $00, $00, $00, $28, $00, $00, $00

Item_MruraGum:
	dc.b	$73, $7D, $59, $7B, $8C, $75, $C4, $00, $00, $00, $00, $00, $28, $00, $00, $00

Item_GreenCard:
	dc.b	$8E, $7C, $A5, $82, $5B, $A5, $9A, $C4, $00, $00, $00, $00, $28, $00, $00, $00

Item_BlueCard:
	dc.b	$9D, $7D, $A5, $5B, $A5, $9A, $C4, $00, $00, $00, $00, $00, $28, $00, $00, $00

Item_YellowCard:
	dc.b	$57, $59, $7F, $A5, $5B, $A5, $9A, $C4, $00, $00, $00, $00, $28, $00, $00, $00

Item_RedCard:
	dc.b	$7E, $88, $9A, $5B, $A5, $9A, $C4, $00, $00, $00, $00, $00, $28, $00, $00, $00

Item_Letter:
	dc.b	$11, $3C, $0D, $24, $12, $43, $3C, $0D, $C4, $00, $00, $00, $08, $00, $00, $00

Item_Recorder:
	dc.b	$61, $62, $68, $75, $7E, $5F, $A5, $96, $A5, $C4, $00, $00, $08, $00, $00, $00

Item_MruraLeaf:
	dc.b	$73, $7D, $59, $7B, $7C, $A5, $9D, $C4, $00, $00, $00, $00, $28, $00, $00, $00

Item_PlsmRing:
	dc.b	$A1, $7B, $93, $73, $7C, $82, $8E, $C4, $00, $00, $00, $00, $08, $00, $00, $00

Item_Prism:
	dc.b	$59, $56, $7F, $A1, $7C, $93, $75, $C4, $00, $00, $00, $00, $08, $00, $00, $00

Item_Telepipe:
	dc.b	$1A, $4D, $23, $5A, $5B, $7C, $6A, $C4, $00, $00, $00, $82, $E8, $00, $00, $00

Item_Escapipe:
	dc.b	$29, $30, $0C, $23, $5A, $5B, $7C, $6A, $C4, $00, $00, $46, $E8, $00, $00, $00

Item_Hidapipe:
	dc.b	$16, $23, $4D, $23, $5A, $5B, $7C, $6A, $C4, $00, $01, $18, $E8, $00, $00, $00

Item_Monomate:
	dc.b	$77, $6E, $76, $57, $69, $C4, $00, $00, $00, $00, $00, $14, $F8, $00, $00, $00

Item_Dimate:
	dc.b	$99, $84, $76, $57, $69, $C4, $00, $00, $00, $00, $00, $3C, $F8, $00, $00, $00

Item_Trimate:
	dc.b	$69, $7C, $76, $57, $69, $C4, $00, $00, $00, $00, $00, $A0, $F8, $00, $00, $00

Item_Antidote:
	dc.b	$56, $82, $68, $84, $A2, $57, $93, $82, $C4, $00, $00, $0A, $F8, $00, $00, $00

Item_StarMist:
	dc.b	$62, $65, $A5, $56, $69, $73, $57, $91, $A5, $C4, $03, $E8, $F8, $00, $00, $00

Item_MoonDew:
	dc.b	$75, $A5, $82, $56, $69, $73, $57, $91, $A5, $C4, $2E, $E0, $F8, $00, $00, $00

Item_Headgear:
	dc.b	$27, $88, $9A, $8D, $56, $C4, $00, $00, $00, $00, $00, $78, $A1, $FD, $00, $03

Item_Ribbon:
	dc.b	$7C, $9E, $82, $C4, $00, $00, $00, $00, $00, $00, $00, $50, $A1, $02, $00, $03

Item_Fibergear:
	dc.b	$8E, $7B, $62, $8D, $56, $C4, $00, $00, $00, $00, $01, $AE, $A1, $FD, $00, $08

Item_SilRibbon:
	dc.b	$61, $7D, $9B, $A5, $7C, $9E, $82, $C4, $00, $00, $01, $7C, $A1, $02, $00, $0C

Item_SilCrown:
	dc.b	$61, $7D, $9B, $A5, $5D, $7B, $58, $82, $C4, $00, $01, $D6, $A1, $A8, $00, $0E

Item_Titanigear:
	dc.b	$66, $65, $82, $8D, $56, $C4, $00, $00, $00, $00, $05, $78, $A1, $FD, $00, $0E

Item_Titanimet:
	dc.b	$66, $65, $82, $76, $88, $69, $C4, $00, $00, $00, $0E, $74, $A1, $41, $00, $10

Item_JwlCrown:
	dc.b	$92, $8A, $59, $7D, $5D, $7B, $58, $82, $C4, $00, $11, $F8, $A1, $A8, $00, $11

Item_JwlRibbon:
	dc.b	$92, $8A, $59, $7D, $7C, $9E, $82, $C4, $00, $00, $12, $5C, $A1, $02, $00, $15

Item_Crescegear:
	dc.b	$5D, $7E, $63, $82, $69, $8D, $56, $C4, $00, $00, $01, $18, $B1, $04, $00, $0E

Item_SnowCrown:
	dc.b	$2F, $11, $23, $10, $38, $2B, $32, $C4, $00, $00, $01, $EA, $B1, $08, $00, $11

Item_WindScarf:
	dc.b	$10, $45, $23, $9B, $82, $96, $6A, $C4, $00, $00, $00, $78, $B1, $80, $00, $11

Item_ColorScarf:
	dc.b	$20, $43, $23, $9B, $82, $96, $6A, $C4, $00, $00, $00, $82, $B1, $20, $00, $11

Item_StormGear:
	dc.b	$62, $69, $A5, $75, $8D, $56, $C4, $00, $00, $00, $02, $76, $B1, $40, $00, $10

Item_Laconigear:
	dc.b	$7B, $5F, $6B, $56, $8D, $56, $C4, $00, $00, $00, $6D, $60, $A1, $14, $00, $1B

Item_Laconiamet:
	dc.b	$7B, $5F, $6B, $56, $76, $88, $69, $C4, $00, $00, $71, $48, $A1, $14, $00, $1D

Item_Neimet:
	dc.b	$6D, $57, $76, $88, $69, $C4, $00, $00, $00, $00, $00, $00, $21, $41, $00, $32

Item_NeiCrown:
	dc.b	$6D, $57, $5D, $7B, $58, $82, $C4, $00, $00, $00, $00, $00, $21, $08, $00, $30

Item_MagicCap:
	dc.b	$73, $92, $88, $5D, $6F, $88, $69, $C4, $00, $00, $00, $00, $21, $01, $00, $02

Item_MogicCap:
	dc.b	$77, $92, $88, $5D, $6F, $88, $69, $C4, $00, $00, $00, $00, $21, $01, $00, $02

Item_CarbonSuit:
	dc.b	$5B, $A5, $9E, $82, $62, $A5, $67, $C4, $00, $00, $00, $80, $A4, $FD, $00, $04

Item_CarbonVest:
	dc.b	$5B, $A5, $9E, $82, $4F, $62, $69, $C4, $00, $00, $00, $78, $A4, $02, $00, $04

Item_FiberCoat:
	dc.b	$8E, $7B, $62, $5F, $A5, $69, $C4, $00, $00, $00, $01, $2C, $A4, $55, $00, $08

Item_FiberCape:
	dc.b	$8E, $7B, $62, $73, $82, $69, $C4, $00, $00, $00, $01, $A4, $A4, $A8, $00, $08

Item_FiberVest:
	dc.b	$8E, $7B, $62, $4F, $62, $69, $C4, $00, $00, $00, $01, $18, $A4, $02, $00, $06

Item_TtnmArmor:
	dc.b	$66, $65, $82, $56, $A5, $73, $A5, $C4, $00, $00, $15, $E0, $A4, $44, $00, $18

Item_TtnmCape:
	dc.b	$66, $65, $82, $71, $84, $9D, $7C, $7B, $C4, $00, $18, $9C, $A4, $28, $00, $1C

Item_TtnmChest:
	dc.b	$66, $65, $82, $66, $86, $62, $69, $C4, $00, $00, $15, $18, $A4, $11, $00, $15

Item_CrmcArmor:
	dc.b	$63, $7B, $74, $88, $5D, $56, $A5, $73, $A5, $C4, $2D, $B4, $A4, $44, $00, $30

Item_CrmcCape:
	dc.b	$63, $7B, $74, $88, $5D, $71, $84, $9D, $7C, $7B, $30, $70, $A4, $A8, $00, $38

Item_CrmcChest:
	dc.b	$63, $7B, $74, $88, $5D, $66, $86, $62, $69, $C4, $27, $10, $A4, $11, $00, $2E

Item_AmberRobe:
	dc.b	$14, $24, $12, $23, $28, $0D, $0C, $C4, $00, $00, $00, $AA, $B4, $10, $00, $14

Item_Crystanish:
	dc.b	$5D, $7C, $62, $65, $6F, $A5, $6B, $88, $61, $8A, $02, $76, $B4, $44, $00, $3C

Item_CrystCape:
	dc.b	$5D, $7C, $62, $65, $71, $84, $A5, $7D, $9A, $C4, $03, $48, $B4, $A8, $00, $3E

Item_CrystChest:
	dc.b	$5D, $7C, $62, $65, $66, $86, $62, $69, $C4, $00, $02, $9E, $B4, $01, $00, $3C

Item_Laconinish:
	dc.b	$7B, $5F, $6B, $56, $6F, $A5, $6B, $88, $61, $8A, $88, $B8, $A4, $44, $00, $41

Item_LaconCape:
	dc.b	$7B, $5F, $6B, $56, $71, $84, $9D, $7C, $7B, $C4, $8C, $A0, $A4, $20, $00, $46

Item_LaconChest:
	dc.b	$7B, $5F, $6B, $56, $66, $86, $62, $69, $C4, $00, $6D, $60, $A4, $01, $00, $50

Item_NeiArmor:
	dc.b	$6D, $57, $6F, $A5, $6B, $88, $61, $8A, $C4, $00, $00, $00, $24, $44, $00, $5F

Item_NeiCape:
	dc.b	$6D, $57, $71, $84, $A5, $7D, $9A, $C4, $00, $00, $00, $00, $24, $88, $00, $58

Item_Shoes:
	dc.b	$7E, $91, $A5, $61, $8A, $A5, $93, $C4, $00, $00, $00, $F0, $A5, $FD, $00, $03

Item_Sandals:
	dc.b	$59, $62, $9F, $9A, $7C, $8A, $A5, $C4, $00, $00, $00, $B4, $A5, $02, $00, $03

Item_Boots:
	dc.b	$7E, $91, $A5, $9D, $A5, $67, $C4, $00, $00, $00, $03, $E8, $A5, $FD, $00, $07

Item_KnifeBoots:
	dc.b	$6A, $57, $71, $9D, $A5, $67, $C4, $00, $00, $00, $10, $68, $A5, $22, $07, $07

Item_LongBoots:
	dc.b	$7F, $82, $8E, $9D, $A5, $67, $C4, $00, $00, $00, $1A, $90, $A5, $20, $05, $07

Item_HirzaBoots:
	dc.b	$6F, $57, $7D, $91, $75, $9D, $A5, $67, $C4, $00, $26, $48, $A5, $88, $00, $07

Item_ShuneBoots:
	dc.b	$61, $8A, $6D, $7B, $9D, $A5, $67, $C4, $00, $00, $1D, $4C, $A5, $A0, $00, $07

Item_GardaBoots:
	dc.b	$8C, $A5, $96, $9D, $A5, $67, $C4, $00, $00, $00, $30, $70, $A5, $55, $00, $0F

Item_CrbnShield:
	dc.b	$5B, $A5, $9E, $82, $61, $A5, $7D, $9A, $C4, $00, $02, $1C, $A2, $55, $00, $08

Item_CrbnEmel:
	dc.b	$5B, $A5, $9E, $82, $59, $A5, $76, $7D, $C4, $00, $01, $A4, $A2, $A8, $00, $07

Item_FibrShield:
	dc.b	$8E, $7B, $62, $61, $A5, $7D, $9A, $C4, $00, $00, $04, $B0, $A2, $55, $00, $0F

Item_FiberEmel:
	dc.b	$8E, $7B, $62, $59, $A5, $76, $7D, $C4, $00, $00, $05, $50, $A2, $A8, $00, $11

Item_MirShield:
	dc.b	$74, $7B, $A5, $61, $A5, $7D, $9A, $C4, $00, $00, $12, $C0, $A2, $55, $00, $20

Item_MirEmel:
	dc.b	$74, $7B, $A5, $59, $A5, $76, $7D, $C4, $00, $00, $14, $00, $A2, $A8, $00, $1E

Item_CerShield:
	dc.b	$63, $7B, $74, $88, $5D, $61, $A5, $7D, $9A, $C4, $20, $6C, $A2, $55, $00, $27

Item_CerEmel:
	dc.b	$63, $7B, $74, $88, $5D, $59, $A5, $76, $7D, $C4, $25, $E4, $A2, $A8, $00, $28

Item_Aegis:
	dc.b	$18, $0C, $25, $1C, $23, $1A, $1D, $C4, $00, $00, $04, $B0, $B2, $50, $00, $20

Item_GrSleeves:
	dc.b	$8E, $7C, $A5, $82, $62, $7C, $A5, $9D, $C4, $00, $03, $48, $B2, $20, $00, $3F

Item_TruthSlvs:
	dc.b	$18, $0C, $0C, $23, $19, $4A, $C4, $00, $00, $00, $02, $D0, $B2, $80, $00, $3B

Item_LaconEmel:
	dc.b	$7B, $5F, $6B, $56, $59, $A5, $76, $7D, $C4, $00, $2E, $E0, $A2, $28, $00, $44

Item_LacShield:
	dc.b	$7B, $5F, $6B, $56, $61, $A5, $7D, $9A, $C4, $00, $32, $C8, $A2, $54, $00, $55

Item_NeiShield:
	dc.b	$6D, $57, $61, $A5, $7D, $9A, $C4, $00, $00, $00, $00, $00, $22, $50, $00, $5F

Item_NeiEmel:
	dc.b	$6D, $57, $59, $A5, $76, $7D, $C4, $00, $00, $00, $00, $00, $22, $A0, $00, $76

Item_Knife:
	dc.b	$6A, $57, $71, $C4, $00, $00, $00, $00, $00, $00, $00, $64, $A2, $FD, $05, $00

Item_Dagger:
	dc.b	$96, $8C, $A5, $C4, $00, $00, $00, $00, $00, $00, $00, $C8, $A2, $D4, $08, $01

Item_Scalpel:
	dc.b	$76, $62, $C4, $00, $00, $00, $00, $00, $00, $00, $00, $B4, $A2, $18, $07, $00

Item_SteelBar:
	dc.b	$62, $66, $A5, $7D, $5D, $7F, $A5, $C4, $00, $00, $00, $50, $A2, $02, $07, $02

Item_Boomerang:
	dc.b	$9D, $A5, $76, $7B, $82, $C4, $00, $00, $00, $00, $01, $E0, $A2, $20, $0C, $00

Item_Slasher:
	dc.b	$62, $7B, $57, $60, $A5, $C4, $00, $00, $00, $00, $07, $D0, $A2, $20, $11, $00

Item_Sword:
	dc.b	$64, $A5, $9A, $C4, $00, $00, $00, $00, $00, $00, $04, $B0, $A3, $01, $12, $04

Item_Whip:
	dc.b	$75, $66, $C4, $00, $00, $00, $00, $00, $00, $00, $05, $78, $A2, $20, $14, $02

Item_CrmcSword:
	dc.b	$63, $7B, $74, $88, $5D, $64, $A5, $9A, $C4, $00, $0C, $80, $A3, $01, $1E, $05

Item_CeramKnife:
	dc.b	$63, $7B, $74, $88, $5D, $6A, $57, $71, $C4, $00, $0A, $F0, $A2, $FD, $14, $03

Item_CeramBar:
	dc.b	$63, $7B, $74, $88, $5D, $5D, $7F, $A5, $C4, $00, $04, $B0, $A2, $02, $1B, $02

Item_LasrSlshr:
	dc.b	$7E, $A5, $91, $A5, $62, $7B, $57, $60, $A5, $C4, $1A, $2C, $A2, $20, $1E, $00

Item_LasrSword:
	dc.b	$7E, $A5, $91, $A5, $64, $A5, $9A, $C4, $00, $00, $15, $18, $A3, $01, $32, $09

Item_LaserBar:
	dc.b	$7E, $A5, $91, $A5, $5D, $7F, $A5, $C4, $00, $00, $0C, $1C, $A2, $02, $26, $03

Item_LaserKnife:
	dc.b	$7E, $A5, $91, $A5, $6A, $57, $71, $C4, $00, $00, $11, $30, $A2, $FD, $1C, $05

Item_SwdOfAnger:
	dc.b	$0C, $10, $32, $23, $1C, $33, $3E, $C4, $00, $00, $01, $18, $A3, $01, $3A, $00

Item_FireSlshr:
	dc.b	$71, $83, $57, $56, $62, $7B, $57, $60, $A5, $C4, $01, $54, $A2, $20, $24, $00

Item_FireStaff:
	dc.b	$10, $0E, $38, $23, $1C, $0E, $C4, $00, $00, $00, $02, $9E, $B2, $08, $20, $0B

Item_LacnMace:
	dc.b	$7B, $5F, $6B, $56, $62, $5E, $A5, $7D, $C4, $00, $41, $A0, $A2, $50, $28, $08

Item_LacDagger:
	dc.b	$7B, $5F, $6B, $56, $96, $8C, $A5, $C4, $00, $00, $47, $E0, $A2, $80, $2D, $07

Item_ACSlasher:
	dc.b	$7B, $5F, $6B, $56, $62, $7B, $57, $60, $A5, $C4, $5D, $C0, $A2, $20, $2A, $00

Item_LacSword:
	dc.b	$7B, $5F, $6B, $56, $64, $A5, $9A, $C4, $00, $00, $55, $F0, $A3, $01, $3E, $07

Item_NeiSword:
	dc.b	$6D, $57, $64, $A5, $9A, $C4, $00, $00, $00, $00, $00, $00, $2B, $01, $4B, $18

Item_NeiSlasher:
	dc.b	$6D, $57, $62, $7B, $57, $60, $A5, $C4, $00, $00, $00, $00, $22, $20, $3C, $00

Item_BowGun:
	dc.b	$9E, $58, $8C, $82, $C4, $00, $00, $00, $00, $00, $01, $2C, $A3, $55, $08, $00

Item_SonicGun:
	dc.b	$64, $6B, $88, $5D, $8C, $82, $C4, $00, $00, $00, $02, $80, $A2, $55, $11, $00

Item_Shotgun:
	dc.b	$61, $8B, $88, $69, $8C, $82, $C4, $00, $00, $00, $03, $20, $A3, $44, $0A, $00

Item_SilentShot:
	dc.b	$60, $57, $7E, $82, $69, $61, $8B, $88, $69, $C4, $03, $98, $A3, $08, $0A, $00

Item_PoisonShot:
	dc.b	$A2, $57, $93, $82, $61, $8B, $88, $69, $C4, $00, $06, $A4, $A2, $18, $0F, $00

Item_AcidShot:
	dc.b	$56, $61, $9A, $61, $8B, $88, $69, $C4, $00, $00, $12, $C0, $A2, $18, $19, $00

Item_Cannon:
	dc.b	$5B, $6E, $82, $C4, $00, $00, $00, $00, $00, $00, $08, $98, $A3, $44, $12, $00

Item_Vulcan:
	dc.b	$9B, $7D, $5B, $82, $C4, $00, $00, $00, $00, $00, $31, $38, $A3, $04, $1C, $00

Item_LaserShot:
	dc.b	$7E, $A5, $91, $A5, $61, $8B, $88, $69, $C4, $00, $18, $38, $A3, $44, $14, $00

Item_LsrCannon:
	dc.b	$7E, $A5, $91, $A5, $5B, $6E, $82, $C4, $00, $00, $4E, $20, $A3, $04, $1E, $00

Item_PlsCannon:
	dc.b	$9F, $7D, $62, $5B, $6E, $82, $C4, $00, $00, $00, $7D, $00, $A3, $04, $23, $00

Item_PulseVlcn:
	dc.b	$9F, $7D, $62, $9B, $7D, $5B, $82, $C4, $00, $00, $BB, $80, $A3, $04, $26, $00

Item_NeiShot:
	dc.b	$6D, $57, $61, $8B, $88, $69, $C4, $00, $00, $00, $00, $00, $23, $04, $3C, $00

Item_PrsnClths:
	dc.b	$16, $3B, $0D, $43, $38, $26, $12, $C4, $00, $00, $00, $64, $04, $FF, $00, $02
	
Item_Teim:
	dc.b	$68, $84, $75, $C4, $00, $00, $00, $00, $00, $00, $00, $00, $08, $00, $00, $00

Item_Visiphone:
	dc.b	$9C, $92, $71, $87, $82, $C4, $00, $00, $00, $00, $0B, $B8, $A8, $00, $00, $00
	
Item_Unknown1:
	dc.b	$65, $57, $7F, $82, $23, $18, $11, $46, $0D, $C4, $F2, $30, $E8, $00, $00, $00
	
Item_Unknown2:
	dc.b	$6F, $A1, $62, $9C, $A5, $C4, $00, $00, $00, $00, $B3, $B0, $E8, $00, $00, $00

	elseif revision=3

	include	"tables/characters/charset1.asm"


Item_None:
	dc.b	$C4, "         "
	dc.w	0
	dc.b	$00, $00, $00, $00

Item_SmallKey:
	dc.b	"CHAVINHA", $C4, " "
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_Dynamite:
	dc.b	"DINAMITE", $C4, " "
	dc.w	0
	dc.b	$48, $00, $00, $00

Item_KeyTube:
	dc.b	"TUBO CHAVE"
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_MruraGum:
	dc.b	 "G MARUERA", $C4
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_GreenCard:
	dc.b	"C VERDE", $C4, "  "
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_BlueCard:
	dc.b	"C AZUL", $C4, "   "
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_YellowCard:
	dc.b	"C AMARELO", $C4
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_RedCard:
	dc.b	"C VERMELHO"
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_Letter:
	dc.b	"CARTA", $C4, "    "
	dc.w	0
	dc.b	$08, $00, $00, $00

Item_Recorder:
	dc.b	"STREAMER", $C4, " "
	dc.w	0
	dc.b	$08, $00, $00, $00

Item_MruraLeaf:
	dc.b	"FL MARUERA"
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_PlsmRing:
	dc.b	"ANEL PLASM"
	dc.w	0
	dc.b	$08, $00, $00, $00

Item_Prism:
	dc.b	"PRISMA", $C4, "   "
	dc.w	0
	dc.b	$08, $00, $00, $00

Item_Telepipe:
	dc.b	"TELEFLAU", $C4, " "
	dc.w	$82
	dc.b	$E8, $00, $00, $00

Item_Escapipe:
	dc.b	"FUGAFLAU", $C4, " "
	dc.w	$46
	dc.b	$E8, $00, $00, $00

Item_Hidapipe:
	dc.b	"OCULTAFLAU"
	dc.w	$118
	dc.b	$E8, $00, $00, $00

Item_Monomate:
	dc.b	"MONOMATE", $C4, " "
	dc.w	$14
	dc.b	$F8, $00, $00, $00

Item_Dimate:
	dc.b	"DIMATE", $C4, "   "
	dc.w	$3C
	dc.b	$F8, $00, $00, $00

Item_Trimate:
	dc.b	"TRIMATE", $C4, "  "
	dc.w	$A0
	dc.b	$F8, $00, $00, $00

Item_Antidote:
	dc.b	"ANTIDOTO", $C4, " "
	dc.w	$0A
	dc.b	$F8, $00, $00, $00

Item_StarMist:
	dc.b	"ESTRL MIST"
	dc.w	$3E8
	dc.b	$F8, $00, $00, $00

Item_MoonDew:
	dc.b	"GOTA LUNAR"
	dc.w	$2EE0
	dc.b	$F8, $00, $00, $00

Item_Headgear:
	dc.b	"ARCO COURO"
	dc.w	$78
	dc.b	$A1
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $03

Item_Ribbon:
	dc.b	"FITA", $C4, "     "
	dc.w	$50
	dc.b	$A1
	dc.b	CharID_Nei_Mask
	dc.b	$00, $03

Item_Fibergear:
	dc.b	"ARCO FIBRA"
	dc.w	$1AE
	dc.b	$A1
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $08

Item_SilRibbon:
	dc.b	"FITA PRAT", $C4
	dc.w	$17C
	dc.b	$A1
	dc.b	CharID_Nei_Mask
	dc.b	$00, $0C

Item_SilCrown:
	dc.b	"COROA PRAT"
	dc.w	$1D6
	dc.b	$A1
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $0E

Item_Titanigear:
	dc.b	"ARCO TITAN"
	dc.w	$578
	dc.b	$A1
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $0E

Item_Titanimet:
	dc.b	"CAP TITAN", $C4
	dc.w	$E74
	dc.b	$A1
	dc.b	CharID_Rolf_Mask|CharID_Kain_Mask
	dc.b	$00, $10

Item_JwlCrown:
	dc.b	"COROA PREC"
	dc.w	$11F8
	dc.b	$A1
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $11

Item_JwlRibbon:
	dc.b	"FITA PREC", $C4
	dc.w	$125C
	dc.b	$A1
	dc.b	CharID_Nei_Mask
	dc.b	$00, $15

Item_Crescegear:
	dc.b	"ARCO CRESC"
	dc.w	$118
	dc.b	$B1
	dc.b	CharID_Rudo_Mask
	dc.b	$00, $0E

Item_SnowCrown:
	dc.b	"COROA NEVE"
	dc.w	$1EA
	dc.b	$B1
	dc.b	CharID_Amy_Mask
	dc.b	$00, $11

Item_WindScarf:
	dc.b	"CACHEC VEN"
	dc.w	$78
	dc.b	$B1
	dc.b	CharID_Shir_Mask
	dc.b	$00, $11

Item_ColorScarf:
	dc.b	"CACHEC COR"
	dc.w	$82
	dc.b	$B1
	dc.b	CharID_Anna_Mask
	dc.b	$00, $11

Item_StormGear:
	dc.b	"ARCO TEMPS"
	dc.w	$276
	dc.b	$B1
	dc.b	CharID_Kain_Mask
	dc.b	$00, $10

Item_Laconigear:
	dc.b	"ARCO LACON"
	dc.w	$6D60
	dc.b	$A1
	dc.b	CharID_Rudo_Mask|CharID_Hugh_Mask
	dc.b	$00, $1B

Item_Laconiamet:
	dc.b	"CAP LACON", $C4
	dc.w	$7148
	dc.b	$A1
	dc.b	CharID_Rudo_Mask|CharID_Hugh_Mask
	dc.b	$00, $1D

Item_Neimet:
	dc.b	"CAP NEI", $C4, "  "
	dc.w	0
	dc.b	$21
	dc.b	CharID_Rolf_Mask|CharID_Kain_Mask
	dc.b	$00, $32

Item_NeiCrown:
	dc.b	"COROA NEI", $C4
	dc.w	0
	dc.b	$21
	dc.b	CharID_Amy_Mask
	dc.b	$00, $30

Item_MagicCap:
	dc.b	"CHAPEU ENC"
	dc.w	0
	dc.b	$21
	dc.b	CharID_Rolf_Mask
	dc.b	$00, $02

Item_MogicCap:
	dc.b	"CHAPEU MAG"
	dc.w	0
	dc.b	$21
	dc.b	CharID_Rolf_Mask
	dc.b	$00, $02

Item_CarbonSuit:
	dc.b	"ROUPA CARB"
	dc.w	$80
	dc.b	$A4
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $04

Item_CarbonVest:
	dc.b	"VEST CARB", $C4
	dc.w	$78
	dc.b	$A4
	dc.b	CharID_Nei_Mask
	dc.b	$00, $04

Item_FiberCoat:
	dc.b	"CAS FIBRA "
	dc.w	$12C
	dc.b	$A4
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $08

Item_FiberCape:
	dc.b	"MANT FIBRA"
	dc.w	$1A4
	dc.b	$A4
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $08

Item_FiberVest:
	dc.b	"VEST FIBRA"
	dc.w	$118
	dc.b	$A4
	dc.b	CharID_Nei_Mask
	dc.b	$00, $06

Item_TtnmArmor:
	dc.b	"ARMD TITAN"
	dc.w	$15E0
	dc.b	$A4
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$00, $18

Item_TtnmCape:
	dc.b	"MANT TITAN"
	dc.w	$189C
	dc.b	$A4
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask
	dc.b	$00, $1C

Item_TtnmChest:
	dc.b	"COL TITAN", $C4
	dc.w	$1518
	dc.b	$A4
	dc.b	CharID_Rolf_Mask|CharID_Hugh_Mask
	dc.b	$00, $15

Item_CrmcArmor:
	dc.b	"ARMD CERAM"
	dc.w	$2DB4
	dc.b	$A4
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$00, $30

Item_CrmcCape:
	dc.b	"MANT CERAM"
	dc.w	$3070
	dc.b	$A4
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $38

Item_CrmcChest:
	dc.b	"COL CERAM", $C4
	dc.w	$2710
	dc.b	$A4
	dc.b	CharID_Rolf_Mask|CharID_Hugh_Mask
	dc.b	$00, $2E

Item_AmberRobe:
	dc.b	"TOGA AMBAR"
	dc.w	$AA
	dc.b	$B4
	dc.b	CharID_Hugh_Mask
	dc.b	$00, $14

Item_Crystanish:
	dc.b	"CRISTALYN", $C4
	dc.w	$276
	dc.b	$B4
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$00, $3C

Item_CrystCape:
	dc.b	"MANT CRIST"
	dc.w	$348
	dc.b	$B4
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $3E

Item_CrystChest:
	dc.b	"COL CRIST", $C4
	dc.w	$29E
	dc.b	$B4
	dc.b	CharID_Rolf_Mask
	dc.b	$00, $3C

Item_Laconinish:
	dc.b	"LACONIAL", $C4, " "
	dc.w	$88B8
	dc.b	$A4
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$00, $41

Item_LaconCape:
	dc.b	"MANT LACON"
	dc.w	$8CA0
	dc.b	$A4
	dc.b	CharID_Anna_Mask
	dc.b	$00, $46

Item_LaconChest:
	dc.b	"COL LACON", $C4
	dc.w	$6D60
	dc.b	$A4
	dc.b	CharID_Rolf_Mask
	dc.b	$00, $50

Item_NeiArmor:
	dc.b	"ARMD NEI", $C4, " "
	dc.w	0
	dc.b	$24
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$00, $5F

Item_NeiCape:
	dc.b	"MANT NEI", $C4, " "
	dc.w	0
	dc.b	$24
	dc.b	CharID_Amy_Mask|CharID_Shir_Mask
	dc.b	$00, $58

Item_Shoes:
	dc.b	"SAPATOS", $C4, "  "
	dc.w	$F0
	dc.b	$A5
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $03

Item_Sandals:
	dc.b	"SANDALIAS", $C4
	dc.w	$B4
	dc.b	$A5
	dc.b	CharID_Nei_Mask
	dc.b	$00, $03

Item_Boots:
	dc.b	"BOTAS", $C4, "    "
	dc.w	$3E8
	dc.b	$A5
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $07

Item_KnifeBoots:
	dc.b	"BOTA FACA", $C4
	dc.w	$1068
	dc.b	$A5
	dc.b	CharID_Nei_Mask|CharID_Anna_Mask
	dc.b	$07, $07

Item_LongBoots:
	dc.b	"BOTA LONGA"
	dc.w	$1A90
	dc.b	$A5
	dc.b	CharID_Anna_Mask
	dc.b	$05, $07

Item_HirzaBoots:
	dc.b	"BOTA HIRZA"
	dc.w	$2648
	dc.b	$A5
	dc.b	CharID_Amy_Mask|CharID_Shir_Mask
	dc.b	$00, $07

Item_ShuneBoots:
	dc.b	"BOTA SHUNE"
	dc.w	$1D4C
	dc.b	$A5
	dc.b	CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $07

Item_GardaBoots:
	dc.b	"BOTA GARDA"
	dc.w	$3070
	dc.b	$A5
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $0F

Item_CrbnShield:
	dc.b	"ESC CARB", $C4, " "
	dc.w	$21C
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $08

Item_CrbnEmel:
	dc.b	"PROT CARB", $C4
	dc.w	$1A4
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $07

Item_FibrShield:
	dc.b	"ESC FIBRA", $C4
	dc.w	$4B0
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $0F

Item_FiberEmel:
	dc.b	"PROT FIBRA"
	dc.w	$550
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $11

Item_MirShield:
	dc.b	"ESC REFLT", $C4
	dc.w	$12C0
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $20

Item_MirEmel:
	dc.b	"PROT REFLT"
	dc.w	$1400
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $1E

Item_CerShield:
	dc.b	"ESC CERAM", $C4
	dc.w	$206C
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $27

Item_CerEmel:
	dc.b	"PROT CERAM"
	dc.w	$25E4
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $28

Item_Aegis:
	dc.b	"EGIDE", $C4, "    "
	dc.w	$4B0
	dc.b	$B2
	dc.b	CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $20

Item_GrSleeves:
	dc.b	"BRC VERDE", $C4
	dc.w	$348
	dc.b	$B2
	dc.b	CharID_Anna_Mask
	dc.b	$00, $3F

Item_TruthSlvs:
	dc.b	"BRC VERDAD"
	dc.w	$2D0
	dc.b	$B2
	dc.b	CharID_Shir_Mask
	dc.b	$00, $3B

Item_LaconEmel:
	dc.b	"PROT LACON"
	dc.w	$2EE0
	dc.b	$A2, $28, $00, $44

Item_LacShield:
	dc.b	"ESC LACON", $C4
	dc.w	$32C8
	dc.b	$A2
	dc.b	CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $55

Item_NeiShield:
	dc.b	"ESC NEI", $C4, "  "
	dc.w	0
	dc.b	$22
	dc.b	CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $5F

Item_NeiEmel:
	dc.b	"PROT NEI", $C4, " "
	dc.w	0
	dc.b	$22
	dc.b	CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $76

Item_Knife:
	dc.b	"FACA", $C4, "     "
	dc.w	$64
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$05, $00

Item_Dagger:
	dc.b	"ADAGA", $C4, "    "
	dc.w	$C8
	dc.b	$A2
	dc.b	CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$08, $01

Item_Scalpel:
	dc.b	"BISTURI", $C4, "  "
	dc.w	$B4
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Hugh_Mask
	dc.b	$07, $00

Item_SteelBar:
	dc.b	"GARRA ACO", $C4
	dc.w	$50
	dc.b	$A2
	dc.b	CharID_Nei_Mask
	dc.b	$07, $02

Item_Boomerang:
	dc.b	"BUMERANGUE"
	dc.w	$1E0
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$0C, $00

Item_Slasher:
	dc.b	"GOLPEADOR", $C4
	dc.w	$7D0
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$11, $00

Item_Sword:
	dc.b	"ESPADA", $C4, "   "
	dc.w	$4B0
	dc.b	$A3
	dc.b	CharID_Rolf_Mask
	dc.b	$12, $04

Item_Whip:
	dc.b	"CHICOTE", $C4, "  "
	dc.w	$578
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$14, $02

Item_CrmcSword:
	dc.b	"ESP CERAM", $C4
	dc.w	$C80
	dc.b	$A3
	dc.b	CharID_Rolf_Mask
	dc.b	$1E, $05

Item_CeramKnife:
	dc.b	"FACA CERAM"
	dc.w	$AF0
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$14, $03

Item_CeramBar:
	dc.b	"GAR CERAM", $C4
	dc.w	$4B0
	dc.b	$A2
	dc.b	CharID_Nei_Mask
	dc.b	$1B, $02

Item_LasrSlshr:
	dc.b	"FOIC LASER"
	dc.w	$1A2C
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$1E, $00

Item_LasrSword:
	dc.b	"ESP LASER", $C4
	dc.w	$1518
	dc.b	$A3
	dc.b	CharID_Rolf_Mask
	dc.b	$32, $09

Item_LaserBar:
	dc.b	"GAR LASER", $C4
	dc.w	$C1C
	dc.b	$A2
	dc.b	CharID_Nei_Mask
	dc.b	$26, $03

Item_LaserKnife:
	dc.b	"FACA LASER"
	dc.w	$1130
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$1C, $05

Item_SwdOfAnger:
	dc.b	"ESP ANG", $C4, "  "
	dc.w	$118
	dc.b	$A3
	dc.b	CharID_Rolf_Mask
	dc.b	$3A, $00

Item_FireSlshr:
	dc.b	"FOICE FOGO"
	dc.w	$154
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$24, $00

Item_FireStaff:
	dc.b	"CAJAD FOGO"
	dc.w	$29E
	dc.b	$B2
	dc.b	CharID_Amy_Mask
	dc.b	$20, $0B

Item_LacnMace:
	dc.b	"MACA LACON"
	dc.w	$41A0
	dc.b	$A2
	dc.b	CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$28, $08

Item_LacDagger:
	dc.b	"ADAG LACON"
	dc.w	$47E0
	dc.b	$A2
	dc.b	CharID_Shir_Mask
; Fix: Laconia Dagger attack and defense boost
	if bugfixes=1
	dc.b	$2D
	dc.b	$07
	else
	dc.b	$04
	dc.b	$16
	endif

Item_ACSlasher:
	dc.b	"FOICE ACID"
	dc.w	$5DC0
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$2A, $00

Item_LacSword:
	dc.b	"ESP LACON", $C4
	dc.w	$55F0
	dc.b	$A3
	dc.b	CharID_Rolf_Mask
	dc.b	$3E, $07

Item_NeiSword:
	dc.b	"ESP NEI", $C4, "  "
	dc.w	0
	dc.b	$2B
	dc.b	CharID_Rolf_Mask
	dc.b	$4B, $18

Item_NeiSlasher:
	dc.b	"FOICE NEI", $C4
	dc.w	0
	dc.b	$22
	dc.b	CharID_Anna_Mask
	dc.b	$3C, $00

Item_BowGun:
	dc.b	"BESTA", $C4, "    "
	dc.w	$12C
	dc.b	$A3
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$08, $00

Item_SonicGun:
	dc.b	"PIST SONIC"
	dc.w	$280
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$11, $00

Item_Shotgun:
	dc.b	"ESPINGARDA"
	dc.w	$320
	dc.b	$A3
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$0A, $00

Item_SilentShot:
	dc.b	"DISP SILEN"
	dc.w	$398
	dc.b	$A3
	dc.b	CharID_Amy_Mask
	dc.b	$0A, $00

Item_PoisonShot:
	dc.b	"DISP VENEN"
	dc.w	$6A4
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Hugh_Mask
	dc.b	$0F, $00

Item_AcidShot:
	dc.b	"DISP ACIDO"
	dc.w	$12C0
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Hugh_Mask
	dc.b	$19, $00

Item_Cannon:
	dc.b	"CANHAO", $C4, "   "
	dc.w	$898
	dc.b	$A3
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$12, $00

Item_Vulcan:
	dc.b	"VULCAO", $C4, "   "
	dc.w	$3138
	dc.b	$A3
	dc.b	CharID_Rudo_Mask
	dc.b	$1C, $00

Item_LaserShot:
	dc.b	"PHASER", $C4, "   "
	dc.w	$1838
	dc.b	$A3
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$14, $00

Item_LsrCannon:
	dc.b	"CANHAO LSR"
	dc.w	$4E20
	dc.b	$A3
	dc.b	CharID_Rudo_Mask
	dc.b	$1E, $00

Item_PlsCannon:
	dc.b	"CANHAO PLS"
	dc.w	$7D00
	dc.b	$A3, $04, $23, $00

Item_PulseVlcn:
	dc.b	"VULCAO PLS"
	dc.w	$BB80
	dc.b	$A3
	dc.b	CharID_Rudo_Mask
	dc.b	$26, $00

Item_NeiShot:
	dc.b	"DISP NEI", $C4, " "
	dc.w	0
	dc.b	$23
	dc.b	CharID_Rudo_Mask
	dc.b	$3C, $00

Item_PrsnClths:
	dc.b	"ROUPA PRSN"
	dc.w	$64
	dc.b	$04
	dc.b	CharID_Rolf_Mask|CharID_Nei_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $02

Item_Teim:
	dc.b	"TEIM", $C4, "     "
	dc.w	0
	dc.b	$08, $00, $00, $00

Item_Visiphone:
	dc.b	"VISIFONE ", $C4
	dc.w	$BB8
	dc.b	$A8, $00, $00, $00

Item_Unknown1:
	dc.b	"T", $C4, "        "
	dc.w	$F230
	dc.b	$E8, $00, $00, $00

Item_Unknown2:
	dc.b	"H", $C4, "        "
	dc.w	$B3B0
	dc.b	$E8, $00, $00, $00
	
	else
	
	include	"tables/characters/charset1.asm"


Item_None:
	dc.b	$C4, "         "
	dc.w	0
	dc.b	$00, $00, $00, $00

Item_SmallKey:
	dc.b	"SMALL KEY", $C4
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_Dynamite:
	dc.b	"DYNAMITE", $C4, " "
	dc.w	0
	dc.b	$48, $00, $00, $00

Item_KeyTube:
	dc.b	"KEY TUBE", $C4, " "
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_MruraGum:
	dc.b	 "MARUERAGUM"
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_GreenCard:
	dc.b	"GREEN CARD"
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_BlueCard:
	dc.b	"BLUE CARD", $C4
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_YellowCard:
	dc.b	"YELLOWCARD"
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_RedCard:
	dc.b	"RED CARD", $C4, " "
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_Letter:
	dc.b	"LETTER", $C4, "   "
	dc.w	0
	dc.b	$08, $00, $00, $00

Item_Recorder:
	dc.b	"RECORDER", $C4, " "
	dc.w	0
	dc.b	$08, $00, $00, $00

Item_MruraLeaf:
	dc.b	"MRURA LEAF"
	dc.w	0
	dc.b	$28, $00, $00, $00

Item_PlsmRing:
	dc.b	"PLASMARING"
	dc.w	0
	dc.b	$08, $00, $00, $00

Item_Prism:
	dc.b	"PRISM", $C4, "    "
	dc.w	0
	dc.b	$08, $00, $00, $00

Item_Telepipe:
	dc.b	"TELEPIPE", $C4, " "
	dc.w	$82
	dc.b	$E8, $00, $00, $00

Item_Escapipe:
	dc.b	"ESCAPIPE", $C4, " "
	dc.w	$46
	dc.b	$E8, $00, $00, $00

Item_Hidapipe:
	dc.b	"HIDAPIPE", $C4, " "
	dc.w	$118
	dc.b	$E8, $00, $00, $00

Item_Monomate:
	dc.b	"MONOMATE", $C4, " "
	dc.w	$14
	dc.b	$F8, $00, $00, $00

Item_Dimate:
	dc.b	"DIMATE", $C4, "   "
	dc.w	$3C
	dc.b	$F8, $00, $00, $00

Item_Trimate:
	dc.b	"TRIMATE", $C4, "  "
	dc.w	$A0
	dc.b	$F8, $00, $00, $00

Item_Antidote:
	dc.b	"ANTIDOTE", $C4, " "
	dc.w	$0A
	dc.b	$F8, $00, $00, $00

Item_StarMist:
	dc.b	"STAR MIST", $C4
	dc.w	$3E8
	dc.b	$F8, $00, $00, $00

Item_MoonDew:
	dc.b	"MOON DEW", $C4, " "
	dc.w	$2EE0
	dc.b	$F8, $00, $00, $00

Item_Headgear:
	dc.b	"HEADGEAR", $C4, " "
	dc.w	$78
	dc.b	$A1
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $03

Item_Ribbon:
	dc.b	"RIBBON", $C4, "   "
	dc.w	$50
	dc.b	$A1
	dc.b	CharID_Nei_Mask
	dc.b	$00, $03

Item_Fibergear:
	dc.b	"FIBERGEAR", $C4
	dc.w	$1AE
	dc.b	$A1
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $08

Item_SilRibbon:
	dc.b	"SIL RIBBON"
	dc.w	$17C
	dc.b	$A1
	dc.b	CharID_Nei_Mask
	dc.b	$00, $0C

Item_SilCrown:
	dc.b	"SIL CROWN", $C4
	dc.w	$1D6
	dc.b	$A1
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $0E

Item_Titanigear:
	dc.b	"TITANIGEAR"
	dc.w	$578
	dc.b	$A1
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $0E

Item_Titanimet:
	dc.b	"TITANIMET", $C4
	dc.w	$E74
	dc.b	$A1
	dc.b	CharID_Rolf_Mask|CharID_Kain_Mask
	dc.b	$00, $10

Item_JwlCrown:
	dc.b	"JWL CROWN", $C4
	dc.w	$11F8
	dc.b	$A1
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $11

Item_JwlRibbon:
	dc.b	"JWL RIBBON"
	dc.w	$125C
	dc.b	$A1
	dc.b	CharID_Nei_Mask
	dc.b	$00, $15

Item_Crescegear:
	dc.b	"CRESCEGEAR"
	dc.w	$118
	dc.b	$B1
	dc.b	CharID_Rudo_Mask
	dc.b	$00, $0E

Item_SnowCrown:
	dc.b	"SNOW CROWN"
	dc.w	$1EA
	dc.b	$B1
	dc.b	CharID_Amy_Mask
	dc.b	$00, $11

Item_WindScarf:
	dc.b	"WIND SCARF"
	dc.w	$78
	dc.b	$B1
	dc.b	CharID_Shir_Mask
	dc.b	$00, $11

Item_ColorScarf:
	dc.b	"COLORSCARF"
	dc.w	$82
	dc.b	$B1
	dc.b	CharID_Anna_Mask
	dc.b	$00, $11

Item_StormGear:
	dc.b	"STORM GEAR"
	dc.w	$276
	dc.b	$B1
	dc.b	CharID_Kain_Mask
	dc.b	$00, $10

Item_Laconigear:
	dc.b	"LACONIGEAR"
	dc.w	$6D60
	dc.b	$A1
	dc.b	CharID_Rudo_Mask|CharID_Hugh_Mask
	dc.b	$00, $1B

Item_Laconiamet:
	dc.b	"LACONIAMET"
	dc.w	$7148
	dc.b	$A1
	dc.b	CharID_Rudo_Mask|CharID_Hugh_Mask
	dc.b	$00, $1D

Item_Neimet:
	dc.b	"NEIMET", $C4, "   "
	dc.w	0
	dc.b	$21
	dc.b	CharID_Rolf_Mask|CharID_Kain_Mask
	dc.b	$00, $32

Item_NeiCrown:
	dc.b	"NEICROWN", $C4, " "
	dc.w	0
	dc.b	$21
	dc.b	CharID_Amy_Mask
	dc.b	$00, $30

Item_MagicCap:
	dc.b	"MAGIC CAP", $C4
	dc.w	0
	dc.b	$21
	dc.b	CharID_Rolf_Mask
	dc.b	$00, $02

Item_MogicCap:
	dc.b	"MOGIC CAP", $C4
	dc.w	0
	dc.b	$21
	dc.b	CharID_Rolf_Mask
	dc.b	$00, $02

Item_CarbonSuit:
	dc.b	"CARBONSUIT"
	dc.w	$80
	dc.b	$A4
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $04

Item_CarbonVest:
	dc.b	"CARBONVEST"
	dc.w	$78
	dc.b	$A4
	dc.b	CharID_Nei_Mask
	dc.b	$00, $04

Item_FiberCoat:
	dc.b	"FIBERCOAT", $C4
	dc.w	$12C
	dc.b	$A4
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $08

Item_FiberCape:
	dc.b	"FIBERCAPE", $C4
	dc.w	$1A4
	dc.b	$A4
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $08

Item_FiberVest:
	dc.b	"FIBERVEST", $C4
	dc.w	$118
	dc.b	$A4
	dc.b	CharID_Nei_Mask
	dc.b	$00, $06

Item_TtnmArmor:
	dc.b	"TTNM ARMOR"
	dc.w	$15E0
	dc.b	$A4
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$00, $18

Item_TtnmCape:
	dc.b	"TTNM CAPE", $C4
	dc.w	$189C
	dc.b	$A4
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask
	dc.b	$00, $1C

Item_TtnmChest:
	dc.b	"TTNM CHEST"
	dc.w	$1518
	dc.b	$A4
	dc.b	CharID_Rolf_Mask|CharID_Hugh_Mask
	dc.b	$00, $15

Item_CrmcArmor:
	dc.b	"CRMC ARMOR"
	dc.w	$2DB4
	dc.b	$A4
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$00, $30

Item_CrmcCape:
	dc.b	"CRMC CAPE", $C4
	dc.w	$3070
	dc.b	$A4
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $38

Item_CrmcChest:
	dc.b	"CRMC CHEST"
	dc.w	$2710
	dc.b	$A4
	dc.b	CharID_Rolf_Mask|CharID_Hugh_Mask
	dc.b	$00, $2E

Item_AmberRobe:
	dc.b	"AMBER ROBE"
	dc.w	$AA
	dc.b	$B4
	dc.b	CharID_Hugh_Mask
	dc.b	$00, $14

Item_Crystanish:
	dc.b	"CRYSTANISH"
	dc.w	$276
	dc.b	$B4
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$00, $3C

Item_CrystCape:
	dc.b	"CRYSTCAPE", $C4
	dc.w	$348
	dc.b	$B4
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $3E

Item_CrystChest:
	dc.b	"CRYSTCHEST"
	dc.w	$29E
	dc.b	$B4
	dc.b	CharID_Rolf_Mask
	dc.b	$00, $3C

Item_Laconinish:
	dc.b	"LACONINISH"
	dc.w	$88B8
	dc.b	$A4
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$00, $41

Item_LaconCape:
	dc.b	"LACONCAPE", $C4
	dc.w	$8CA0
	dc.b	$A4
	dc.b	CharID_Anna_Mask
	dc.b	$00, $46

Item_LaconChest:
	dc.b	"LACONCHEST"
	dc.w	$6D60
	dc.b	$A4
	dc.b	CharID_Rolf_Mask
	dc.b	$00, $50

Item_NeiArmor:
	dc.b	"NEIARMOR", $C4, " "
	dc.w	0
	dc.b	$24
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$00, $5F

Item_NeiCape:
	dc.b	"NEICAPE", $C4, "  "
	dc.w	0
	dc.b	$24
	dc.b	CharID_Amy_Mask|CharID_Shir_Mask
	dc.b	$00, $58

Item_Shoes:
	dc.b	"SHOES", $C4, "    "
	dc.w	$F0
	dc.b	$A5
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $03

Item_Sandals:
	dc.b	"SANDALS", $C4, "  "
	dc.w	$B4
	dc.b	$A5
	dc.b	CharID_Nei_Mask
	dc.b	$00, $03

Item_Boots:
	dc.b	"BOOTS", $C4, "    "
	dc.w	$3E8
	dc.b	$A5
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $07

Item_KnifeBoots:
	dc.b	"KNIFEBOOTS"
	dc.w	$1068
	dc.b	$A5
	dc.b	CharID_Nei_Mask|CharID_Anna_Mask
	dc.b	$07, $07

Item_LongBoots:
	dc.b	"LONG BOOTS"
	dc.w	$1A90
	dc.b	$A5
	dc.b	CharID_Anna_Mask
	dc.b	$05, $07

Item_HirzaBoots:
	dc.b	"HIRZABOOTS"
	dc.w	$2648
	dc.b	$A5
	dc.b	CharID_Amy_Mask|CharID_Shir_Mask
	dc.b	$00, $07

Item_ShuneBoots:
	dc.b	"SHUNEBOOTS"
	dc.w	$1D4C
	dc.b	$A5
	dc.b	CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $07

Item_GardaBoots:
	dc.b	"GARDABOOTS"
	dc.w	$3070
	dc.b	$A5
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $0F

Item_CrbnShield:
	dc.b	"CRBNSHIELD"
	dc.w	$21C
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $08

Item_CrbnEmel:
	dc.b	"CRBN EMEL", $C4
	dc.w	$1A4
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $07

Item_FibrShield:
	dc.b	"FIBRSHILD", $C4
	dc.w	$4B0
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $0F

Item_FiberEmel:
	dc.b	"FIBER EMEL"
	dc.w	$550
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $11

Item_MirShield:
	dc.b	"MIR SHIELD"
	dc.w	$12C0
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $20

Item_MirEmel:
	dc.b	"MIR EMEL", $C4, " "
	dc.w	$1400
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $1E

Item_CerShield:
	dc.b	"CER SHIELD"
	dc.w	$206C
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $27

Item_CerEmel:
	dc.b	"CER EMEL", $C4, " "
	dc.w	$25E4
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $28

Item_Aegis:
	dc.b	"AEGIS", $C4, "    "
	dc.w	$4B0
	dc.b	$B2
	dc.b	CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $20

Item_GrSleeves:
	dc.b	"GR SLEEVES"
	dc.w	$348
	dc.b	$B2
	dc.b	CharID_Anna_Mask
	dc.b	$00, $3F

Item_TruthSlvs:
	dc.b	"TRUTH SLVS"
	dc.w	$2D0
	dc.b	$B2
	dc.b	CharID_Shir_Mask
	dc.b	$00, $3B

Item_LaconEmel:
	dc.b	"LACON EMEL"
	dc.w	$2EE0
	dc.b	$A2, $28, $00, $44

Item_LacShield:
	dc.b	"LAC SHIELD"
	dc.w	$32C8
	dc.b	$A2
	dc.b	CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $55

Item_NeiShield:
	dc.b	"NEISHIELD", $C4
	dc.w	0
	dc.b	$22
	dc.b	CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$00, $5F

Item_NeiEmel:
	dc.b	"NEIEMEL", $C4, "  "
	dc.w	0
	dc.b	$22
	dc.b	CharID_Anna_Mask|CharID_Shir_Mask
	dc.b	$00, $76

Item_Knife:
	dc.b	"KNIFE", $C4, "    "
	dc.w	$64
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$05, $00

Item_Dagger:
	dc.b	"DAGGER", $C4, "   "
	dc.w	$C8
	dc.b	$A2
	dc.b	CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$08, $01

Item_Scalpel:
	dc.b	"SCALPEL", $C4, "  "
	dc.w	$B4
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Hugh_Mask
	dc.b	$07, $00

Item_SteelBar:
	dc.b	"STEEL BAR", $C4
	dc.w	$50
	dc.b	$A2
	dc.b	CharID_Nei_Mask
	dc.b	$07, $02

Item_Boomerang:
	dc.b	"BOOMERANG", $C4
	dc.w	$1E0
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$0C, $00

Item_Slasher:
	dc.b	"SLASHER", $C4, "  "
	dc.w	$7D0
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$11, $00

Item_Sword:
	dc.b	"SWORD", $C4, "    "
	dc.w	$4B0
	dc.b	$A3
	dc.b	CharID_Rolf_Mask
	dc.b	$12, $04

Item_Whip:
	dc.b	"WHIP", $C4, "     "
	dc.w	$578
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$14, $02

Item_CrmcSword:
	dc.b	"CERAM SWRD"
	dc.w	$C80
	dc.b	$A3
	dc.b	CharID_Rolf_Mask
	dc.b	$1E, $05

Item_CeramKnife:
	dc.b	"CERAM KNFE"
	dc.w	$AF0
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$14, $03

Item_CeramBar:
	dc.b	"CERAM BAR", $C4
	dc.w	$4B0
	dc.b	$A2
	dc.b	CharID_Nei_Mask
	dc.b	$1B, $02

Item_LasrSlshr:
	dc.b	"LASR SLSHR"
	dc.w	$1A2C
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$1E, $00

Item_LasrSword:
	dc.b	"LASR SWRD", $C4
	dc.w	$1518
	dc.b	$A3
	dc.b	CharID_Rolf_Mask
	dc.b	$32, $09

Item_LaserBar:
	dc.b	"LASR BAR", $C4, " "
	dc.w	$C1C
	dc.b	$A2
	dc.b	CharID_Nei_Mask
	dc.b	$26, $03

Item_LaserKnife:
	dc.b	"LASER KNFE"
	dc.w	$1130
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$1C, $05

Item_SwdOfAnger:
	dc.b	"SWD OF ANG"
	dc.w	$118
	dc.b	$A3
	dc.b	CharID_Rolf_Mask
	dc.b	$3A, $00

Item_FireSlshr:
	dc.b	"FIRE SLSHR"
	dc.w	$154
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$24, $00

Item_FireStaff:
	dc.b	"FIRE STAFF"
	dc.w	$29E
	dc.b	$B2
	dc.b	CharID_Amy_Mask
	dc.b	$20, $0B

Item_LacnMace:
	dc.b	"LACN MACE", $C4
	dc.w	$41A0
	dc.b	$A2
	dc.b	CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$28, $08

Item_LacDagger:
	dc.b	"LAC DAGGER"
	dc.w	$47E0
	dc.b	$A2
	dc.b	CharID_Shir_Mask
; Fix: Laconia Dagger attack and defense boost
	if bugfixes=1
	dc.b	$2D
	dc.b	$07
	else
	dc.b	$04
	dc.b	$16
	endif

Item_ACSlasher:
	dc.b	"AC SLASHR "
	dc.w	$5DC0
	dc.b	$A2
	dc.b	CharID_Anna_Mask
	dc.b	$2A, $00

Item_LacSword:
	dc.b	"LAC SWORD", $C4
	dc.w	$55F0
	dc.b	$A3
	dc.b	CharID_Rolf_Mask
	dc.b	$3E, $07

Item_NeiSword:
	dc.b	"NEISWORD", $C4, " "
	dc.w	0
	dc.b	$2B
	dc.b	CharID_Rolf_Mask
	dc.b	$4B, $18

Item_NeiSlasher:
	dc.b	"NEISLASHER"
	dc.w	0
	dc.b	$22
	dc.b	CharID_Anna_Mask
	dc.b	$3C, $00

Item_BowGun:
	dc.b	"BOW GUN", $C4, "  "
	dc.w	$12C
	dc.b	$A3
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$08, $00

Item_SonicGun:
	dc.b	"SONIC GUN", $C4
	dc.w	$280
	dc.b	$A2
	dc.b	CharID_Rolf_Mask|CharID_Rudo_Mask|CharID_Hugh_Mask|CharID_Kain_Mask
	dc.b	$11, $00

Item_Shotgun:
	dc.b	"SHOTGUN", $C4, "  "
	dc.w	$320
	dc.b	$A3
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$0A, $00

Item_SilentShot:
	dc.b	"SILENTSHOT"
	dc.w	$398
	dc.b	$A3
	dc.b	CharID_Amy_Mask
	dc.b	$0A, $00

Item_PoisonShot:
	dc.b	"POISONSHOT"
	dc.w	$6A4
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Hugh_Mask
	dc.b	$0F, $00

Item_AcidShot:
	dc.b	"ACIDSHOT", $C4, " "
	dc.w	$12C0
	dc.b	$A2
	dc.b	CharID_Amy_Mask|CharID_Hugh_Mask
	dc.b	$19, $00

Item_Cannon:
	dc.b	"CANNON", $C4, "   "
	dc.w	$898
	dc.b	$A3
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$12, $00

Item_Vulcan:
	dc.b	"VULCAN", $C4, "   "
	dc.w	$3138
	dc.b	$A3
	dc.b	CharID_Rudo_Mask
	dc.b	$1C, $00

Item_LaserShot:
	dc.b	"LASER SHOT"
	dc.w	$1838
	dc.b	$A3
	dc.b	CharID_Rudo_Mask|CharID_Kain_Mask
	dc.b	$14, $00

Item_LsrCannon:
	dc.b	"LSR CANNON"
	dc.w	$4E20
	dc.b	$A3
	dc.b	CharID_Rudo_Mask
	dc.b	$1E, $00

Item_PlsCannon:
	dc.b	"PLS CANNON"
	dc.w	$7D00
	dc.b	$A3, $04, $23, $00

Item_PulseVlcn:
	dc.b	"PULSE VLCN"
	dc.w	$BB80
	dc.b	$A3
	dc.b	CharID_Rudo_Mask
	dc.b	$26, $00

Item_NeiShot:
	dc.b	"NEISHOT", $C4, "  "
	dc.w	0
	dc.b	$23
	dc.b	CharID_Rudo_Mask
	dc.b	$3C, $00

Item_PrsnClths:
	dc.b	"PRSN CLTHS"
	dc.w	$64
	dc.b	$04
	dc.b	CharID_Rolf_Mask|CharID_Nei_Mask|CharID_Rudo_Mask|CharID_Amy_Mask|CharID_Hugh_Mask|CharID_Anna_Mask|CharID_Kain_Mask|CharID_Shir_Mask
	dc.b	$00, $02

Item_Teim:
	dc.b	"TEIM", $C4, "     "
	dc.w	0
	dc.b	$08, $00, $00, $00

Item_Visiphone:
	dc.b	"VISIPHONE", $C4
	dc.w	$BB8
	dc.b	$A8, $00, $00, $00

Item_Unknown1:
	dc.b	"T", $C4, "        "
	dc.w	$F230
	dc.b	$E8, $00, $00, $00

Item_Unknown2:
	dc.b	"H", $C4, "        "
	dc.w	$B3B0
	dc.b	$E8, $00, $00, $00
	
	endif
; =======================================================================

; =======================================================================
; All technique data
;
; bytes 1-5 = Technique name
; byte 6 = TP Consumption
; byte 7 = bitfield determining different actions
; byte 8 = damage/heal rate value
; =======================================================================
TechniqueData:
	if revision=0

Tech_None:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00

Tech_Foi:
	dc.b	$71, $87, $57, $59, $C4, $02, $F1, $0F

Tech_Gifoi:
	dc.b	$8D, $71, $87, $57, $59, $06, $F1, $28

Tech_Nafoi:
	dc.b	$6A, $71, $87, $57, $59, $0C, $F1, $82

Tech_Zan:
	dc.b	$91, $82, $C4, $00, $00, $04, $F2, $14

Tech_Gizan:
	dc.b	$8D, $91, $82, $C4, $00, $07, $F2, $1E

Tech_Nazan:
	dc.b	$6A, $91, $82, $C4, $00, $0B, $F2, $64

Tech_Gra:
	dc.b	$8E, $7B, $9D, $69, $C4, $08, $F4, $14

Tech_Gigra:
	dc.b	$8D, $8E, $7B, $9D, $69, $0C, $F4, $28

Tech_Nagra:
	dc.b	$6A, $8E, $7B, $9D, $69, $14, $F4, $50

Tech_Tsu:
	dc.b	$8E, $7B, $82, $67, $C4, $06, $F1, $1E

Tech_Githu:
	dc.b	$8D, $8E, $7B, $82, $67, $0D, $F1, $50

Tech_Nathu:
	dc.b	$6A, $8E, $7B, $82, $67, $14, $F1, $96

Tech_Shift:
	dc.b	$61, $71, $65, $C4, $00, $05, $30, $14

Tech_Fanbi:
	dc.b	$71, $83, $82, $9C, $56, $02, $F1, $0A

Tech_Eijia:
	dc.b	$59, $57, $92, $56, $C4, $04, $D2, $17

Tech_Brose:
	dc.b	$A1, $7F, $63, $96, $82, $08, $D1, $FF

Tech_Conte:
	dc.b	$5F, $82, $68, $7D, $C4, $06, $D1, $00

Tech_Gaj:
	dc.b	$8C, $A5, $92, $C4, $00, $01, $D1, $14

Tech_Gigaj:
	dc.b	$8D, $8C, $A5, $92, $C4, $05, $D1, $3C

Tech_Nagaj:
	dc.b	$6A, $8C, $A5, $92, $C4, $0F, $D1, $96

Tech_Sag:
	dc.b	$60, $8C, $A5, $92, $C4, $03, $D4, $14

Tech_Gisag:
	dc.b	$8D, $60, $8C, $A5, $92, $0F, $D4, $3C

Tech_Nasag:
	dc.b	$6A, $60, $8C, $A5, $92, $1B, $D4, $96

Tech_Gen:
	dc.b	$92, $86, $6D, $7B, $C4, $01, $B1, $14

Tech_Sagen:
	dc.b	$60, $92, $86, $6D, $7B, $03, $B4, $14

Tech_Vol:
	dc.b	$9E, $7D, $69, $C4, $00, $08, $B1, $FF

Tech_Savol:
	dc.b	$60, $9E, $7D, $69, $C4, $10, $B2, $FF

Tech_Shiza:
	dc.b	$61, $A5, $91, $62, $C4, $06, $B1, $00

Tech_Doran:
	dc.b	$9A, $7B, $82, $5D, $C4, $02, $B1, $00

Tech_Rimit:
	dc.b	$7C, $74, $65, $C4, $00, $03, $B1, $00

Tech_Shinb:
	dc.b	$61, $82, $9F, $7F, $C4, $04, $B4, $00

Tech_Forsa:
	dc.b	$71, $87, $7D, $60, $C4, $02, $D2, $00

Tech_Rimet:
	dc.b	$7C, $74, $68, $C4, $00, $03, $D1, $00

Tech_Shu:
	dc.b	$61, $8A, $A5, $67, $C4, $03, $11, $00

Tech_Sashu:
	dc.b	$60, $61, $8A, $A5, $67, $08, $14, $00

Tech_Deban:
	dc.b	$99, $9B, $82, $9A, $C4, $04, $14, $00

Tech_Ner:
	dc.b	$61, $8A, $6D, $7B, $C4, $02, $11, $00

Tech_Saner:
	dc.b	$60, $61, $8A, $6D, $7B, $06, $14, $00

Tech_Res:
	dc.b	$7E, $62, $65, $C4, $00, $03, $19, $14

Tech_Gires:
	dc.b	$8D, $7E, $62, $65, $C4, $07, $19, $3C

Tech_Nares:
	dc.b	$6A, $7E, $62, $65, $C4, $0D, $19, $FF

Tech_Sar:
	dc.b	$60, $7E, $62, $65, $C4, $0D, $1C, $14

Tech_Gisar:
	dc.b	$8D, $60, $7E, $62, $65, $1D, $1C, $3C

Tech_Nasar:
	dc.b	$6A, $60, $7E, $62, $65, $35, $1C, $FF

Tech_Sak:
	dc.b	$60, $A5, $5D, $7B, $C4, $01, $19, $FF

Tech_Nasak:
	dc.b	$6A, $60, $A5, $5D, $7B, $01, $1C, $FF

Tech_Anti:
	dc.b	$56, $82, $68, $84, $C4, $02, $09, $00

Tech_Rever:
	dc.b	$7C, $9B, $A5, $60, $A5, $1E, $09, $00

Tech_Ryuka:
	dc.b	$7C, $8A, $A5, $5B, $A5, $08, $0C, $00

Tech_Hinas:
	dc.b	$70, $A5, $6A, $62, $C4, $04, $0C, $00

Tech_Musik:
	dc.b	$75, $61, $5B, $C4, $00, $03, $04, $00

Tech_Megid:
	dc.b	$76, $8D, $9A, $C4, $00, $37, $F4, $00

Tech_Unknown1:
	dc.b	$7D, $8A, $A5, $71, $86, $1C, $09, $00

Tech_Unknown2:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00

Tech_Unknown3:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00

Tech_Unknown4:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00

Tech_Unknown5:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00

Tech_Unknown6:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00

Tech_Unknown7:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00

Tech_Unknown8:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00

Tech_Unknown9:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00

Tech_UnknownA:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00

Tech_UnknownB:
	dc.b	$C4, $00, $00, $00, $00, $00, $00, $00

	else

Tech_None:
	dc.b	$C4, "    "
	dc.b	$00, $00, $00

Tech_Foi:
	dc.b	"FOI", $C4, " "
	dc.b	$02, $F1, $0F

Tech_Gifoi:
	dc.b	"GIFOI"
	dc.b	$06, $F1, $28

Tech_Nafoi:
	dc.b	"NAFOI"
	dc.b	$0C, $F1, $82

Tech_Zan:
	dc.b	"ZAN", $C4, " "
	dc.b	$04, $F2, $14

Tech_Gizan:
	dc.b	"GIZAN"
	dc.b	$07, $F2, $1E

Tech_Nazan:
	dc.b	"NAZAN"
	dc.b	$0B, $F2, $64

Tech_Gra:
	dc.b	"GRA", $C4, " "
	dc.b	$08, $F4, $14

Tech_Gigra:
	dc.b	"GIGRA"
	dc.b	$0C, $F4, $28

Tech_Nagra:
	dc.b	"NAGRA"
	dc.b	$14, $F4, $50

Tech_Tsu:
	dc.b	"TSU", $C4, " "
	dc.b	$06, $F1, $1E

Tech_Githu:
	dc.b	"GITHU"
	dc.b	$0D, $F1, $50

Tech_Nathu:
	dc.b	"NATHU"
	dc.b	$14, $F1, $96

Tech_Shift:
	dc.b	"SHIFT"
	dc.b	$05, $30, $14

Tech_Fanbi:
	dc.b	"FANBI"
	dc.b	$02, $F1, $0A

Tech_Eijia:
	dc.b	"EIJIA"
	dc.b	$04, $D2, $17

Tech_Brose:
	dc.b	"BROSE"
	dc.b	$08, $D1, $FF

Tech_Conte:
	dc.b	"CONTE"
	dc.b	$06, $D1, $00

Tech_Gaj:
	dc.b	"GAJ", $C4, " "
	dc.b	$01, $D1, $14

Tech_Gigaj:
	dc.b	"GIGAJ"
	dc.b	$05, $D1, $3C

Tech_Nagaj:
	dc.b	"NAGAJ"
	dc.b	$0F, $D1, $96

Tech_Sag:
	dc.b	"SAG", $C4, " "
	dc.b	$03, $D4, $14

Tech_Gisag:
	dc.b	"GISAG"
	dc.b	$0F, $D4, $3C

Tech_Nasag:
	dc.b	"NASAG"
	dc.b	$1B, $D4, $96

Tech_Gen:
	dc.b	"GEN", $C4, " "
	dc.b	$01, $B1, $14

Tech_Sagen:
	dc.b	"SAGEN"
	dc.b	$03, $B4, $14

Tech_Vol:
	dc.b	"VOL", $C4, " "
	dc.b	$08, $B1, $FF

Tech_Savol:
	dc.b	"SAVOL"
	dc.b	$10, $B2, $FF

Tech_Shiza:
	dc.b	"SHIZA"
	dc.b	$06, $B1, $00

Tech_Doran:
	dc.b	"DORAN"
	dc.b	$02, $B1, $00

Tech_Rimit:
	dc.b	"RIMIT"
	dc.b	$03, $B1, $00

Tech_Shinb:
	dc.b	"SHINB"
	dc.b	$04, $B4, $00

Tech_Forsa:
	dc.b	"FORSA"
	dc.b	$02, $D2, $00

Tech_Rimet:
	dc.b	"RIMET"
	dc.b	$03, $D1, $00

Tech_Shu:
	dc.b	"SHU", $C4, " "
	dc.b	$03, $11, $00

Tech_Sashu:
	dc.b	"SASHU"
	dc.b	$08, $14, $00

Tech_Deban:
	dc.b	"DEBAN"
	dc.b	$04, $14, $00

Tech_Ner:
	dc.b	"NER", $C4, " "
	dc.b	$02, $11, $00

Tech_Saner:
	dc.b	"SANER"
	dc.b	$06, $14, $00

Tech_Res:
	dc.b	"RES", $C4, " "
	dc.b	$03, $19, $14

Tech_Gires:
	dc.b	"GIRES"
	dc.b	$07, $19, $3C

Tech_Nares:
	dc.b	"NARES"
	dc.b	$0D, $19, $FF

Tech_Sar:
	dc.b	"SAR", $C4, " "
	dc.b	$0D, $1C, $14

Tech_Gisar:
	dc.b	"GISAR"
	dc.b	$1D, $1C, $3C

Tech_Nasar:
	dc.b	"NASAR"
	dc.b	$35, $1C, $FF

Tech_Sak:
	dc.b	"SAK", $C4, " "
	dc.b	$01, $19, $FF

Tech_Nasak:
	dc.b	"NASAK"
	dc.b	$01, $1C, $FF

Tech_Anti:
	dc.b	"ANTI", $C4
	dc.b	$02, $09, $00

Tech_Rever:
	dc.b	"REVER"
	dc.b	$1E, $09, $00

Tech_Ryuka:
	dc.b	"RYUKA"
	dc.b	$08, $0C, $00

Tech_Hinas:
	dc.b	"HINAS"
	dc.b	$04, $0C, $00

Tech_Musik:
	dc.b	"MUSIK"
	dc.b	$03, $04, $00

Tech_Megid:
	dc.b	"MEGID"
	dc.b	$37, $F4, $00

Tech_Unknown1:
	dc.b	"RRRRR"
	dc.b	$1C, $09, $00

Tech_Unknown2:
	dc.b	$C4, "    "
	dc.b	$00, $00, $00

Tech_Unknown3:
	dc.b	$C4, "    "
	dc.b	$00, $00, $00

Tech_Unknown4:
	dc.b	$C4, "    "
	dc.b	$00, $00, $00

Tech_Unknown5:
	dc.b	$C4, "    "
	dc.b	$00, $00, $00

Tech_Unknown6:
	dc.b	$C4, "    "
	dc.b	$00, $00, $00

Tech_Unknown7:
	dc.b	$C4, "    "
	dc.b	$00, $00, $00

Tech_Unknown8:
	dc.b	$C4, "    "
	dc.b	$00, $00, $00

Tech_Unknown9:
	dc.b	$C4, "    "
	dc.b	$00, $00, $00

Tech_UnknownA:
	dc.b	$C4, "    "
	dc.b	$00, $00, $00

Tech_UnknownB:
	dc.b	$C4, "    "
	dc.b	$00, $00, $00
	
	charset
	
	endif
; =======================================================================
