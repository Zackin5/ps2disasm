; ==========================================================================
; Weapon properties
;
; byte 1 = fixed damage (only for guns)
; byte 2 = range
; byte 3 = sound associated to weapon
; byte 4 = unused - probably to keep all pointers even
; byte 5 = index of WeaponTechPLCPtrs table
; bytes 6-8 = first set of sprite mappings
; bytes 10-12 = second set of sprite mappings
; ==========================================================================
WeaponProperties:

WeaponProp_Knife:
	dc.b	$00, $00, SFXID_Boomerang, $00
	dc.l	Map_WeaponKnife
	dc.l	0

WeaponProp_Dagger:
	dc.b	$00, $00, SFXID_Boomerang, $00
	dc.l	Map_WeaponKnife
	dc.l	0

WeaponProp_Scalpel:
	dc.b	$00, $00, SFXID_Boomerang, $00
	dc.l	Map_WeaponKnife
	dc.l	0

WeaponProp_SteelBar:
	dc.b	$00, $00, SFXID_Claw, $00
	dc.l	$04000000|Map_WeaponBar
	dc.l	0

WeaponProp_Boomerang:
	dc.b	$00, $02, SFXID_Boomerang, $00
	dc.l	$07000000|Map_WpnSlasherThrown
	dc.l	$25000000|Map_WpnSlasherAttack

WeaponProp_Slasher:
	dc.b	$00, $01, SFXID_Slasher, $00
	dc.l	$07000000|Map_WpnSlasherThrown
	dc.l	$26000000|Map_WpnSlasherAttack

WeaponProp_Sword:
	dc.b	$00, $00, SFXID_Sword, $00
	dc.l	$81000000|Map_WeaponSword
	dc.l	0

WeaponProp_Whip:
	dc.b	$00, $00, SFXID_Whip, $00
	dc.l	Map_WeaponKnife
	dc.l	0

WeaponProp_CrmcSword:
	dc.b	$00, $00, SFXID_Sword, $00
	dc.l	$81000000|Map_WeaponSword
	dc.l	0

WeaponProp_CeramKnife:
	dc.b	$00, $00, SFXID_Boomerang, $00
	dc.l	Map_WeaponKnife
	dc.l	0

WeaponProp_CeramBar:
	dc.b	$00, $00, SFXID_Claw, $00
	dc.l	$04000000|Map_WeaponBar
	dc.l	0

WeaponProp_LasrSlshr:
	dc.b	$00, $01, SFXID_Slasher, $00
	dc.l	$07000000|Map_WpnSlasherThrown
	dc.l	$27000000|Map_WpnSlasherAttack

WeaponProp_LasrSword:
	dc.b	$00, $00, SFXID_Sword, $00
	dc.l	$82000000|Map_WpnLaserSwd
	dc.l	0

WeaponProp_LaserBar:
	dc.b	$00, $00, SFXID_Claw, $00
	dc.l	$85000000|Map_WpnLaserBar
	dc.l	0

WeaponProp_LaserKnife:
	dc.b	$00, $00, SFXID_NeifirstAttack, $00
	dc.l	$81000000|Map_WeaponSword
	dc.l	0

WeaponProp_SwdOfAnger:
	dc.b	$00, $00, SFXID_Sword, $00
	dc.l	$82000000|Map_WpnLaserSwd
	dc.l	0

WeaponProp_FireSlshr:
	dc.b	$00, $01, SFXID_Slasher, $00
	dc.l	$07000000|Map_WpnSlasherThrown
	dc.l	$28000000|Map_WpnSlasherAttack

WeaponProp_FireStaff:
	dc.b	$00, $00, SFXID_Whip, $00
	dc.l	$06000000|Map_WpnFireStaff
	dc.l	0

WeaponProp_LacnMace:
	dc.b	$00, $00, SFXID_Whip, $00
	dc.l	Map_WeaponKnife
	dc.l	0

WeaponProp_LacDagger:
	dc.b	$00, $00, SFXID_Boomerang, $00
	dc.l	$82000000|Map_WpnLaserSwd
	dc.l	0

WeaponProp_ACSlasher:
	dc.b	$00, $01, SFXID_Slasher, $00
	dc.l	$07000000|Map_WpnSlasherThrown
	dc.l	$A9000000|Map_WpnSlasherAttack

WeaponProp_LacSword:
	dc.b	$00, $00, SFXID_Sword, $00
	dc.l	$03000000|Map_WpnLacSword
	dc.l	0

WeaponProp_NeiSword:
	dc.b	$00, $00, SFXID_Sword, $00
	dc.l	$03000000|Map_WpnLacSword
	dc.l	0

WeaponProp_NeiSlasher:
	dc.b	$00, $01, SFXID_Slasher, $00
	dc.l	$07000000|Map_WpnSlasherThrown
	dc.l	$AA000000|Map_WpnSlasherAttack

WeaponProp_BowGun:
	dc.b	$05, $01, SFXID_Shotgun, $00
	dc.l	$08000000|Map_WpnBowGun
	dc.l	0

WeaponProp_SonicGun:
	dc.b	$07, $01, SFXID_Shotgun, $00
	dc.l	$08000000|Map_WpnBowGun
	dc.l	0

WeaponProp_Shotgun:
	dc.b	$0A, $02, SFXID_Shotgun, $00
	dc.l	$08000000|Map_WpnBowGun
	dc.l	$39000000|Map_WpnBowGun

WeaponProp_SilentShot:
	dc.b	$01, $01, SFXID_AmoebaAttack, $00
	dc.l	$8C000000|Map_FanbiAcidShot
	dc.l	0

WeaponProp_PoisonShot:
	dc.b	$0A, $01, SFXID_AmoebaAttack, $00
	dc.l	$8C000000|Map_FanbiAcidShot
	dc.l	0

WeaponProp_AcidShot:
	dc.b	$14, $01, SFXID_AmoebaAttack, $00
	dc.l	$8C000000|Map_FanbiAcidShot
	dc.l	0

WeaponProp_Cannon:
	dc.b	$1C, $01, SFXID_Shotgun, $00
	dc.l	$08000000|Map_WpnBowGun
	dc.l	0

WeaponProp_Vulcan:
	dc.b	$10, $03, SFXID_Shotgun, $00
	dc.l	$08000000|Map_WpnBowGun
	dc.l	$3A000000|Map_WpnBowGun

WeaponProp_LaserShot:
	dc.b	$23, $01, SFXID_StrongGun, $00
	dc.l	$09000000|Map_TsuAndLaserShot
	dc.l	0

WeaponProp_LsrCannon:
	dc.b	$35, $01, SFXID_StrongGun, $00
	dc.l	$09000000|Map_TsuAndLaserShot
	dc.l	0

WeaponProp_PlsCannon:
	dc.b	$3C, $01, SFXID_StrongGun, $00
	dc.l	$8A000000|Map_WeaponPulse
	dc.l	0

WeaponProp_PulseVlcn:
	dc.b	$12, $04, SFXID_StrongGun, $00
	dc.l	$8A000000|Map_WeaponPulse
	dc.l	$BB000000|Map_WeaponPulse

WeaponProp_Neishot:
	dc.b	$64, $01, SFXID_StrongGun, $00
	dc.l	$0B000000|Map_WpnNeiShotFired
	dc.l	$3E000000|Map_MegidAndNeiShotAttack

; ==========================================================================


; ==========================================================================
; Technique properties
;
; byte 1 = success rate
; byte 2 = sound associated to technique
; byte 3 = index of WeaponTechPLCPtrs table
; bytes 4-6 = first set of sprite mappings (when cast)
; bytes 8-10 = second set of sprite mappings (when target is hit)
; ==========================================================================
TechniqueProperties:

TechProp_Foi:
	dc.b	$E5, SFXID_Foi
	dc.l	$0D000000|Map_TechFoi
	dc.l	Map_TechFoi

TechProp_Gifoi:
	dc.b	$E5, SFXID_Foi
	dc.l	$0D000000|Map_TechFoi
	dc.l	Map_TechFoi

TechProp_Nafoi:
	dc.b	$E5, SFXID_Foi
	dc.l	$0D000000|Map_TechFoi
	dc.l	Map_TechFoi

TechProp_Zan:
	dc.b	$E5, SFXID_Zan
	dc.l	$0E000000|Map_TechZanCast
	dc.l	$3C000000|Map_TechZanAttack

TechProp_Gizan:
	dc.b	$E5, SFXID_Zan
	dc.l	$0E000000|Map_TechZanCast
	dc.l	$3C000000|Map_TechZanAttack

TechProp_Nazan:
	dc.b	$E5, SFXID_Zan
	dc.l	$0E000000|Map_TechZanCast
	dc.l	$3D000000|Map_TechZanAttack

TechProp_Gra:
	dc.b	$E5, SFXID_Vol
	dc.l	$0F000000|Map_TechGraCast
	dc.l	$2B000000|Map_TechGraAttack

TechProp_Gigra:
	dc.b	$E5, SFXID_Vol
	dc.l	$0F000000|Map_TechGraCast
	dc.l	$2B000000|Map_TechGraAttack

TechProp_Nagra:
	dc.b	$E5, SFXID_Vol
	dc.l	$0F000000|Map_TechGraCast
	dc.l	$2C000000|Map_TechGraAttack

TechProp_Tsu:
	dc.b	$E5, SFXID_Tsu
	dc.l	$10000000|Map_TechTsuCast
	dc.l	$40000000|Map_TsuAndLaserShot

TechProp_Githu:
	dc.b	$E5, SFXID_Tsu
	dc.l	$10000000|Map_TechTsuCast
	dc.l	$40000000|Map_TsuAndLaserShot

TechProp_Nathu:
	dc.b	$E5, SFXID_Tsu
	dc.l	$10000000|Map_TechTsuCast
	dc.l	$40000000|Map_TsuAndLaserShot

TechProp_Shift:
	dc.b	$FF, SFXID_Healed
	dc.l	$11000000|Map_TechShiftCast
	dc.l	$AE000000|Map_TechShiftAttack

TechProp_Fanbi:
	dc.b	$FF, SFXID_Healed
	dc.l	$12000000|Map_TechShiftCast
	dc.l	$9B000000|Map_FanbiAcidShot

TechProp_Eijia:
	dc.b	$FF, SFXID_Eijia
	dc.l	$13000000|Map_TechGraCast
	dc.l	Map_TechEijiaAttack

TechProp_Brose:
	dc.b	$7F, SFXID_Eijia
	dc.l	$13000000|Map_TechGraCast
	dc.l	$44000000|Map_TechEijiaAttack

TechProp_Conte:
	dc.b	$FF, SFXID_Eijia
	dc.l	$13000000|Map_TechGraCast
	dc.l	$44000000|Map_TechEijiaAttack

TechProp_Gaj:
	dc.b	$FF, SFXID_Gaj
	dc.l	$14000000|Map_TechGajCast
	dc.l	$33000000|Map_TechGajAttack

TechProp_Gigaj:
	dc.b	$E5, SFXID_Gaj
	dc.l	$14000000|Map_TechGajCast
	dc.l	$34000000|Map_TechGajAttack

TechProp_Nagaj:
	dc.b	$E5, SFXID_Gaj
	dc.l	$14000000|Map_TechGajCast
	dc.l	$35000000|Map_TechGajAttack

TechProp_Sag:
	dc.b	$E5, SFXID_Gaj
	dc.l	$14000000|Map_TechGajCast
	dc.l	$01000000|Map_TechGajAttack

TechProp_Gisag:
	dc.b	$E5, SFXID_Gaj
	dc.l	$14000000|Map_TechGajCast
	dc.l	$02000000|Map_TechGajAttack

TechProp_Nasag:
	dc.b	$E5, SFXID_Gaj
	dc.l	$14000000|Map_TechGajCast
	dc.l	$03000000|Map_TechGajAttack

TechProp_Gen:
	dc.b	$E5, SFXID_Foi
	dc.l	$95000000|Map_TechGen
	dc.l	$BF000000|Map_TechGen

TechProp_Sagen:
	dc.b	$E5, SFXID_Foi
	dc.l	$95000000|Map_TechGen
	dc.l	$BF000000|Map_TechGen

TechProp_Vol:
	dc.b	$99, SFXID_Vol
	dc.l	$95000000|Map_TechGen
	dc.l	$BF000000|Map_TechGen

TechProp_Savol:
	dc.b	$B2, SFXID_Vol
	dc.l	$95000000|Map_TechGen
	dc.l	$BF000000|Map_TechGen

TechProp_Shiza:
	dc.b	$FF, SFXID_Shinb
	dc.l	$95000000|Map_TechGen
	dc.l	$BF000000|Map_TechGen

TechProp_Doran:
	dc.b	$CC, SFXID_Shinb
	dc.l	$95000000|Map_TechGen
	dc.l	$BF000000|Map_TechGen

TechProp_Rimit:
	dc.b	$7F, SFXID_Shinb
	dc.l	$95000000|Map_TechGen
	dc.l	$BF000000|Map_TechGen

TechProp_Shinb:
	dc.b	$FF, SFXID_Shinb
	dc.l	$95000000|Map_TechGen
	dc.l	$BF000000|Map_TechGen

TechProp_Forsa:
	dc.b	$7F, SFXID_Shinb
	dc.l	$13000000|Map_TechGraCast
	dc.l	Map_TechEijiaAttack

TechProp_Rimet:
	dc.b	$66, SFXID_Shinb
	dc.l	$13000000|Map_TechGraCast
	dc.l	$44000000|Map_TechEijiaAttack

TechProp_Shu:
	dc.b	$FF, SFXID_Deban
	dc.l	$11000000|Map_TechShiftCast
	dc.l	$AE000000|Map_TechShiftAttack

TechProp_Sashu:
	dc.b	$FF, SFXID_Deban
	dc.l	$11000000|Map_TechShiftCast
	dc.l	$AE000000|Map_TechShiftAttack

TechProp_Deban:
	dc.b	$FF, SFXID_Deban
	dc.l	$16000000|Map_TechShiftCast
	dc.l	$2F000000|Map_TechDebanAttack

TechProp_Ner:
	dc.b	$FF, SFXID_Deban
	dc.l	$11000000|Map_TechShiftCast
	dc.l	$AE000000|Map_TechShiftAttack

TechProp_Saner:
	dc.b	$FF, SFXID_Deban
	dc.l	$11000000|Map_TechShiftCast
	dc.l	$AE000000|Map_TechShiftAttack

TechProp_Res:
	dc.b	$FF, SFXID_Healed
	dc.l	$17000000|Map_TechShiftCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Gires:
	dc.b	$FF, SFXID_Healed
	dc.l	$17000000|Map_TechShiftCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Nares:
	dc.b	$FF, SFXID_Healed
	dc.l	$17000000|Map_TechShiftCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Sar:
	dc.b	$FF, SFXID_Healed
	dc.l	$17000000|Map_TechShiftCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Gisar:
	dc.b	$FF, SFXID_Healed
	dc.l	$17000000|Map_TechShiftCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Nasar:
	dc.b	$FF, SFXID_Healed
	dc.l	$17000000|Map_TechShiftCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Sak:
	dc.b	$FF, SFXID_Healed
	dc.l	$18000000|Map_TechSakCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Nasak:
	dc.b	$FF, SFXID_Healed
	dc.l	$18000000|Map_TechSakCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Anti:
	dc.b	$FF, SFXID_Healed
	dc.l	$17000000|Map_TechShiftCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Rever:
	dc.b	$FF, SFXID_Healed
	dc.l	$17000000|Map_TechShiftCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Ryuka:
	dc.b	$FF, SFXID_Healed
	dc.l	$17000000|Map_TechShiftCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Hinas:
	dc.b	$FF, SFXID_Healed
	dc.l	$17000000|Map_TechShiftCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Musik:
	dc.b	$FF, SFXID_Healed
	dc.l	$17000000|Map_TechShiftCast
	dc.l	$2D000000|Map_TechShiftCast

TechProp_Megid:
	dc.b	$FF, SFXID_Gaj
	dc.l	$19000000|Map_TechMegidCast
	dc.l	$3E000000|Map_MegidAndNeiShotAttack

; ==========================================================================