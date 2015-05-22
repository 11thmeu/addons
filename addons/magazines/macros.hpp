
#define MAGAZINE_GROUP_STANAG4179 magazineGroup[] = {"MEU_STANAG4179"}
#define MAGAZINE_GROUP_M249 magazineGroup[] = {"MEU_M249"}
#define MAGAZINE_GROUP_300BO magazineGroup[] = {"MEU_300BO"}
#define MAGAZINE_GROUP_MP5_9MM magazineGroup[] = {"MEU_MP5_9mm"}
#define MAGAZINE_GROUP_MK11 magazineGroup[] = {"MEU_MK11"}
#define MAGAZINE_GROUP_762BELT magazineGroup[] = {"MEU_762BELT"}
#define MAGAZINE_GROUP_M14 magazineGroup[] = {"MEU_M14"}
#define MAGAZINE_GROUP_M40 magazineGroup[] = {"MEU_M40"}
#define MAGAZINE_GROUP_762BULLETS magazineGroup[] = {"MEU_762BULLETS"}

/*#define MAGAZINE_LIST_M203_GL "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F", \
                    "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell", \
                    "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", \
                    "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M4009", "rhs_mag_m576", "rhs_mag_M585_white", "rhs_mag_M661_green", "rhs_mag_M662_red", \
                    "rhs_mag_M713_red", "rhs_mag_M714_white", "rhs_mag_M715_green", "rhs_mag_M716_yellow"


// Magazines for 5.56x45mm NATO
#define MAGAZINE_LIST_STANAG4179_RIFLE "MEU_30Rnd_STANAG4179_M855A1", "MEU_30Rnd_STANAG4179_M856A1", "MEU_30Rnd_STANAG4179_Mk262Mod1", "MEU_20Rnd_STANAG4179_Mk262Mod1", \
"MEU_100Rnd_BetaCMag"

#define MAGAZINE_LIST_STANAG4179_M249 "MEU_200Rnd_M249_M855A1", "MEU_200Rnd_M249_M856A1", "MEU_100Rnd_M249_M855A1", "MEU_100Rnd_M249_M856A1"

// Magazines for .300 AAC weapons
#define MAGAZINE_LIST_STANAG300 "MEU_29_STANAG300_OTM", "MEU_29_STANAG300_OTM_S"

#define MAGAZINE_LIST_MK11 "MEU_20Rnd_MK11_M80A1", "MEU_20Rnd_MK11_M80A1_T",  "MEU_20Rnd_MK11_Mk316Mod0", \
                     "MEU_20Rnd_MK11_LapuaFMJBTSub"

#define MAGAZINE_LIST_762BELT "MEU_100Rnd_Belt_M80A1", "MEU_100Rnd_Belt_M80A1_T"

#define MAGAZINE_LIST_M14 "MEU_20Rnd_M14_M80", "MEU_20Rnd_M14_Mk316Mod0", "MEU_20Rnd_M14_LapuaFMJBTSub", "MEU_20Rnd_M14_M118LR"

#define MAGAZINE_LIST_M40 "MEU_5Rnd_M40_Mk316Mod0", "MEU_5Rnd_M40_M118LR"

#define MAGAZINE_LIST_762BULLETS "MEU_5Rnd_Bullet_Mk316Mod0", "MEU_5Rnd_Bullet_M118LR"*/

// -------------
//   Magazines
// -------------

// Magazines for 5.56 STANAG weapons, includes BETA C-Mags and quality ammo
#define MAGAZINES_STANAG "MEU_30Rnd_STANAG4179_M855A1", "MEU_30Rnd_STANAG4179_M856A1", \
                         "MEU_30Rnd_STANAG4179_Mk262Mod1", "MEU_20Rnd_STANAG4179_Mk262Mod1", "MEU_100Rnd_BetaCMag", \
                         "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "20Rnd_556x45_UW_mag", \
                         "30Rnd_556x45_mag_RHARD_MK318", "30Rnd_556x45_mag_RHARD_MK262", "30Rnd_556x45_mag_RHARD_M855", \
                         "RH_30Rnd_556x45_M855A1", "RH_30Rnd_556x45_Mk262", "RH_30Rnd_556x45_Mk318", "RH_20Rnd_556x45_M855A1", "RH_20Rnd_556x45_Mk262", "RH_20Rnd_556x45_Mk318", "RH_60Rnd_556x45_M855A1", "RH_60Rnd_556x45_Mk262", "RH_60Rnd_556x45_Mk318", \
                         "hlc_30rnd_556x45_EPR", "hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_SPR", "hlc_50rnd_556x45_EPR", "hlc_30rnd_556x45_S", \
                         "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", "rhs_mag_30Rnd_556x45_Mk318_Stanag", "rhs_mag_30Rnd_556x45_Mk262_Stanag", \
                         "30Rnd_mas_556x45_Stanag", "30Rnd_mas_556x45_T_Stanag", \
                         "MEU_30Rnd_SimunitionFX"

// Magazines for long range 5.56 STANAG weapons with priority for quality ammo
#define MAGAZINES_STANAG_LR "MEU_30Rnd_STANAG4179_Mk262Mod1", "MEU_20Rnd_STANAG4179_Mk262Mod1", \
                            "30Rnd_556x45_mag_RHARD_MK318", "30Rnd_556x45_mag_RHARD_MK262", "30Rnd_556x45_mag_RHARD_M855", \
                            "RH_30Rnd_556x45_Mk262", "RH_30Rnd_556x45_Mk318", "RH_20Rnd_556x45_Mk262", "RH_20Rnd_556x45_Mk318", "RH_60Rnd_556x45_Mk262", "RH_60Rnd_556x45_Mk318", \
                            "rhs_mag_30Rnd_556x45_Mk318_Stanag", "rhs_mag_30Rnd_556x45_Mk262_Stanag", \
                            "MEU_30Rnd_STANAG4179_M855A1", "MEU_30Rnd_STANAG4179_M856A1", "MEU_100Rnd_BetaCMag", \
                            "RH_30Rnd_556x45_M855A1", "RH_20Rnd_556x45_M855A1", "RH_60Rnd_556x45_M855A1", \
                            "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "20Rnd_556x45_UW_mag", \
                            "hlc_30rnd_556x45_EPR", "hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_SPR", "hlc_50rnd_556x45_EPR", "hlc_30rnd_556x45_S", \
                            "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", \
                            "30Rnd_mas_556x45_Stanag", "30Rnd_mas_556x45_T_Stanag", \
                            "MEU_30Rnd_SimunitionFX"

// Magazines for the 5.56 STANAG M27 IAR with priority for quality and big magazines
#define MAGAZINES_IAR "MEU_100Rnd_BetaCMag", "RH_60Rnd_556x45_Mk262", "RH_60Rnd_556x45_Mk318", "RH_60Rnd_556x45_M855A1", "hlc_50rnd_556x45_EPR", \
                      "MEU_30Rnd_STANAG4179_Mk262Mod1", "30Rnd_556x45_mag_RHARD_MK262", "30Rnd_556x45_mag_RHARD_MK318", "30Rnd_556x45_mag_RHARD_M855", "RH_30Rnd_556x45_Mk262", \
                      "RH_30Rnd_556x45_Mk318", "RH_20Rnd_556x45_Mk262", "RH_20Rnd_556x45_Mk318", "MEU_20Rnd_STANAG4179_Mk262Mod1", "hlc_30rnd_556x45_SOST", "rhs_mag_30Rnd_556x45_Mk318_Stanag", "rhs_mag_30Rnd_556x45_Mk262_Stanag", \
                      "hlc_30rnd_556x45_SPR", "hlc_30rnd_556x45_EPR", "hlc_30rnd_556x45_S", "MEU_30Rnd_STANAG4179_M855A1", "MEU_30Rnd_STANAG4179_M856A1", \
                      "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "20Rnd_556x45_UW_mag", \
                      "RH_30Rnd_556x45_M855A1", "RH_20Rnd_556x45_M855A1", "30Rnd_mas_556x45_Stanag", "30Rnd_mas_556x45_T_Stanag", \
                      "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", \
                      "MEU_30Rnd_SimunitionFX"
                            
// Magazines for 5.56 STANAG machineguns
#define MAGAZINES_STANAG_MG "MEU_200Rnd_M249_M855A1", "MEU_200Rnd_M249_M856A1", "MEU_100Rnd_M249_M855A1", "MEU_100Rnd_M249_M856A1" \
                            "200Rnd_mas_556x45_Stanag", "200Rnd_mas_556x45_T_Stanag", \
                            "rhsusf_100Rnd_556x45_soft_pouch", \
                            "MEU_30Rnd_STANAG4179_M855A1", "MEU_30Rnd_STANAG4179_M856A1", \
                            "MEU_30Rnd_STANAG4179_Mk262Mod1", "MEU_20Rnd_STANAG4179_Mk262Mod1", "MEU_100Rnd_BetaCMag", \
                            "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "20Rnd_556x45_UW_mag", \
                            "30Rnd_556x45_mag_RHARD_MK318", "30Rnd_556x45_mag_RHARD_MK262", "30Rnd_556x45_mag_RHARD_M855", \
                            "RH_60Rnd_556x45_M855A1", "RH_60Rnd_556x45_Mk262", "RH_60Rnd_556x45_Mk318", "RH_30Rnd_556x45_M855A1", "RH_30Rnd_556x45_Mk262", "RH_30Rnd_556x45_Mk318", "RH_20Rnd_556x45_M855A1", "RH_20Rnd_556x45_Mk262", "RH_20Rnd_556x45_Mk318", \
                            "hlc_30rnd_556x45_EPR", "hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_SPR", "hlc_50rnd_556x45_EPR", "hlc_30rnd_556x45_S", \
                            "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", "rhs_mag_30Rnd_556x45_Mk318_Stanag", "rhs_mag_30Rnd_556x45_Mk262_Stanag", \
                            "30Rnd_mas_556x45_Stanag", "30Rnd_mas_556x45_T_Stanag", \
                            "MEU_30Rnd_SimunitionFX"
                         
// Magazines for 7.62 weapons
#define MAGAZINES_762 "MEU_20Rnd_MK11_M80", "MEU_20Rnd_MK11_M80_T", \
                      "MEU_20Rnd_MK11_Mk316Mod0", "MEU_20Rnd_MK11_LapuaFMJBTSub", \
                      "20Rnd_mas_762x51_Stanag", "20Rnd_mas_762x51_T_Stanag", \
                      "RH_20Rnd_762x51_M80A1", "RH_20Rnd_762x51_Mk316LR", "RH_20Rnd_762x51_LFMJSB", \
                      "20Rnd_762x51_Mag", \
                      "Trixie_20x762_Mag"

// Magazines for long range 7.62 weapons with priority for quality ammo
#define MAGAZINES_762_LR "MEU_20Rnd_MK11_Mk316Mod0", \
                         "RH_20Rnd_762x51_Mk316LR", "RH_20Rnd_762x51_LFMJSB", \
                         "MEU_20Rnd_MK11_M80", "MEU_20Rnd_MK11_M80_T", "RH_20Rnd_762x51_M80A1", \
                         "MEU_20Rnd_MK11_LapuaFMJBTSub", \
                         "20Rnd_mas_762x51_Stanag", "20Rnd_mas_762x51_T_Stanag", \
                         "20Rnd_762x51_Mag", \
                         "Trixie_20x762_Mag"
                         
// Magazines for 7.62 machineguns
#define MAGAZINES_762_MG "MEU_100Rnd_Belt_M80", "MEU_100Rnd_Belt_M80_T", "rhsusf_100Rnd_762x51", \
                         "100Rnd_mas_762x51_Stanag", "100Rnd_mas_762x51_T_Stanag", \
                         "150Rnd_762x51_Box", "150Rnd_762x51_Box_Tracer"

// Magazines for M24
#define MAGAZINES_M24 "MEU_5Rnd_Bullet_Mk316Mod0", \
                      "Trixie_5x762_Mag", \
                      "5Rnd_mas_762x51_Stanag", "5Rnd_mas_762x51_T_Stanag"
                         
// Magazines for the AR-10 from 1960 
#define MAGAZINES_AR10 "RH_20Rnd_762x51_AR10"

// Magazines for the SR 25
#define MAGAZINES_SR25 "MEU_20Rnd_MK11_Mk316Mod0", "MEU_20Rnd_MK11_LapuaFMJBTSub", \
                        "RH_20Rnd_762x51_Mk319", "RH_20Rnd_762x51_LFMJSB", \
                       "MEU_20Rnd_MK11_M80", "MEU_20Rnd_MK11_M80_T", "RH_20Rnd_762x51_M80A1", \
                       "20Rnd_mas_762x51_Stanag", "20Rnd_mas_762x51_T_Stanag", \
                       "20Rnd_762x51_Mag", \
                       "rhsusf_20Rnd_762x51_m118_special_Mag", "rhsusf_20Rnd_762x51_m993_Mag", \
                       "Trixie_20x762_Mag"

// Magazines for .300 AAC weapons
#define MAGAZINES_300 "MEU_29_STANAG300_OTM", "MEU_29_STANAG300_OTM_S", \
                      "29rnd_300BLK_STANAG", "29rnd_300BLK_STANAG_T", "29rnd_300BLK_STANAG_S", \
                      "RH_30Rnd_762x35_FMJ", "RH_30Rnd_762x35_Match", "RH_30Rnd_762x35_MSB"

// Magazines for MP5
#define MAGAZINES_MP5 "hlc_30Rnd_9x19_B_MP5", "hlc_30Rnd_9x19_GD_MP5", "hlc_30Rnd_9x19_SD_MP5", \
                      "RH_32Rnd_9mm_M822", "RH_32Rnd_9mm_HP", "RH_32Rnd_9mm_HPSB", \
                      "30Rnd_mas_9x21_Stanag", \
                      "30Rnd_9x21_Mag"
                      
// Magazines for 6.8x43 STANAG weapons
#define MAGAZINES_68x43 "RH_30Rnd_68x43_FMJ", "RH_30Rnd_68x43_Match"                      

// Magazines for MP5/10
#define MAGAZINES_MP510 "hlc_30Rnd_10mm_B_MP5", "hlc_30Rnd_10mm_JHP_MP5"                      
                      
// Magazines for MP7
#define MAGAZINES_MP7 "40Rnd_mas_46x30_Mag", \
                      "C1987_40Rnd_46x30_mp7", "C1987_20Rnd_46x30_mp7"

// Magazines for underwater MP5
#define MAGAZINES_MP5_UW "30Rnd_mas_9x21d_Stanag", "30Rnd_mas_9x21_Stanag", \
                         "30Rnd_9x21_Mag"
                      
// Magazines for the M40A3 Rifle
#define MAGAZINES_M40A3 "MEU_5Rnd_M40_Mk316Mod0", "MEU_5Rnd_M40_M80", "5Rnd_762x51_M40", "Trixie_5x762_Mag"

// Magazines for the M40A5 Rifle
#define MAGAZINES_M40A5 "MEU_5Rnd_M40_Mk316Mod0", "10Rnd_762x51_M40", "MEU_5Rnd_M40_M80", "5Rnd_762x51_M40"

// Magazines for the M2010 Enhanced Sniper Rifle
#define MAGAZINES_XM2010 "rhsusf_5Rnd_300winmag_xm2010"

// Magazines for the CZ550
#define MAGAZINES_CZ550 "Trixie_CZ550_Mag"

// Magazines for the CZ750
#define MAGAZINES_CZ750 "Trixie_10x762_Mag"

// Magazines for .338 Lapua Magnum weapons
#define MAGAZINES_338 "Trixie_5x338_Mag"

// Magazines for 10Rnd .338 Lapua Magnum weapons
#define MAGAZINES_338_10 "10Rnd_mas_338_Stanag", "10Rnd_mas_338_T_Stanag", "Trixie_5x338_Mag"

// Magazines for .50 BMG (12.7×99mm) weapons
#define MAGAZINES_50BMG "Trixie_10x127_mag", "Trixie_10x127_HE_Mag", "Trixie_10x127_HEIAP_Mag", \
                        "5Rnd_mas_127x99_Stanag", "5Rnd_mas_127x99_dem_Stanag", "5Rnd_mas_127x99_T_Stanag"

// Magazines for the Heckler & Koch G3
#define MAGAZINES_G3 "hlc_20rnd_762x51_b_G3", "hlc_20rnd_762x51_mk316_G3", "hlc_20rnd_762x51_barrier_G3", "hlc_20rnd_762x51_T_G3", "hlc_50rnd_762x51_M_G3", "hlc_20rnd_762x51_S_G3", \
                     "20Rnd_mas_762x51_Stanag", "20Rnd_mas_762x51_T_Stanag", \
                     "20Rnd_762x51_Mag"
                     
// Magazines for the Heckler & Koch HK53
#define MAGAZINES_HK53 "hlc_30rnd_556x45_b_hk33", "hlc_30rnd_556x45_t_hk33", "hlc_30rnd_556x45_epr_hk33", "hlc_30rnd_556x45_sost_hk33", \
                       "MEU_30Rnd_STANAG4179_M855A1", "MEU_30Rnd_STANAG4179_M856A1", \
                       "MEU_30Rnd_STANAG4179_Mk262Mod1", "MEU_20Rnd_STANAG4179_Mk262Mod1", "MEU_100Rnd_BetaCMag", \
                       "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", \
                       "30Rnd_556x45_mag_RHARD_MK318", "30Rnd_556x45_mag_RHARD_MK262", "30Rnd_556x45_mag_RHARD_M855", \
                       "RH_30Rnd_556x45_Mk262", \
                       "hlc_30rnd_556x45_EPR", "hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_SPR", "hlc_50rnd_556x45_EPR", "hlc_30rnd_556x45_S"

// Magazines for the FN FAL
#define MAGAZINES_FAL "hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_20Rnd_762x51_S_fal", "hlc_50rnd_762x51_M_FAL", \
                      "20Rnd_mas_762x51_Stanag", "20Rnd_mas_762x51_T_Stanag", \
                      "Trixie_FNFAL_Mag", "Trixie_FNFAL_Mag_T", \
                      "20Rnd_762x51_Mag"
                       
// Magazines for the M14 and the M21
#define MAGAZINES_M14 "MEU_20Rnd_M14_Mk316Mod0", "MEU_20Rnd_M14_Mk319Mod0", "MEU_20Rnd_M14_LapuaFMJBTSub", \
                      "MEU_20Rnd_M14_M80", \
                      "hlc_20Rnd_762x51_B_M14", "hlc_20Rnd_762x51_Barrier_M14", "hlc_20Rnd_762x51_mk316_M14", "hlc_20Rnd_762x51_T_M14", "hlc_50Rnd_762x51_B_M14", "hlc_20Rnd_762x51_S_M14", \
                      "Trixie_20x762_Mag", \
                      "20Rnd_mas_762x51_Stanag","20Rnd_mas_762x51_T_Stanag", \
                      "rhsusf_20Rnd_762x51_m118_special_Mag", "rhsusf_20Rnd_762x51_m993_Mag", \
                      "20Rnd_762x51_Mag"
                      
// Magazines for the M60 machinegun
#define MAGAZINES_M60 "MEU_100Rnd_Belt_M80", "MEU_100Rnd_Belt_M80_T", \
                      "hlc_100Rnd_762x51_B_M60E4", "hlc_100Rnd_762x51_M_M60E4", "hlc_100Rnd_762x51_T_M60E4", \
                      "100Rnd_mas_762x51_Stanag", "100Rnd_mas_762x51_T_Stanag", \
                      "150Rnd_762x51_Box", "150Rnd_762x51_Box_Tracer",
                      
// Magazines for the Lee Enfield
#define MAGAZINES_Enfield "Trixie_Enfield_Mag", \
                          "5Rnd_mas_762x51_Stanag", "5Rnd_mas_762x51_T_Stanag"
                      
// Magazines for 5.45x39 soviet/russian weapons
#define MAGAZINES_RU545 "hlc_30Rnd_545x39_B_AK", "hlc_30Rnd_545x39_T_AK", "hlc_30Rnd_545x39_EP_AK", "hlc_45Rnd_545x39_t_rpk", "hlc_30Rnd_545x39_S_AK", \
                        "30Rnd_mas_545x39_mag", "30Rnd_mas_545x39_T_mag", \
                        "rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_AK_green", \
                        "rhs_45Rnd_545x39_AK", "rhs_45Rnd_545x39_7N10_AK", "rhs_45Rnd_545x39_7N22_AK", "rhs_45Rnd_545x39_AK_green"

// Magazines for 5.45x39 soviet/russian machineguns
#define MAGAZINES_RU545_MG "hlc_30Rnd_545x39_B_AK", "hlc_30Rnd_545x39_T_AK", "hlc_30Rnd_545x39_EP_AK", "hlc_45Rnd_545x39_t_rpk", "hlc_30Rnd_545x39_S_AK", \
                           "100Rnd_mas_545x39_mag", "100Rnd_mas_545x39_T_mag", "30Rnd_mas_545x39_mag", "30Rnd_mas_545x39_T_mag", \
                           "rhs_45Rnd_545x39_AK", "rhs_45Rnd_545x39_7N10_AK", "rhs_45Rnd_545x39_7N22_AK", "rhs_45Rnd_545x39_AK_green", \
                           "rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_AK_green"
                        
// Magazines for 7.62x39 soviet/russian weapons
#define MAGAZINES_RU762 "hlc_30Rnd_762x39_b_ak", "hlc_30Rnd_762x39_t_ak", "hlc_45Rnd_762x39_m_rpk", "HLC_45rnd_762x39_T_RPK", "hlc_30rnd_762x39_s_ak", \
                        "30Rnd_mas_762x39_mag", "30Rnd_mas_762x39_T_mag", \
                        "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer", "rhs_30Rnd_762x39mm_89"

// Magazines for 7.62x39 soviet/russian machineguns
#define MAGAZINES_RU762_MG "hlc_75Rnd_762x39_m_rpk", "hlc_45Rnd_762x39_m_rpk", "HLC_45rnd_762x39_T_RPK", "hlc_30Rnd_762x39_b_ak", "hlc_30Rnd_762x39_t_ak", "hlc_30rnd_762x39_s_ak", \
                           "100Rnd_mas_762x39_mag", "100Rnd_mas_762x39_T_mag", "30Rnd_mas_762x39_mag", "30Rnd_mas_762x39_T_mag", \
                           "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer", "rhs_30Rnd_762x39mm_89"
                        
// Magazines for 7.62x54 soviet/russian snipers
#define MAGAZINES_RU762x54_LR "rhs_10Rnd_762x54mmR_7N1", \
                              "10Rnd_mas_762x54_mag", "10Rnd_mas_762x54_T_mag"

// Magazines for 7.62x54 soviet/russian machineguns
#define MAGAZINES_RU762x54_MG "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green", \
                              "100Rnd_mas_762x54_mag", "100Rnd_mas_762x54_T_mag"
                              
// Magazines for 20Rnd 9x39mm soviet/russian weapons
#define MAGAZINES_RU939 "20Rnd_mas_9x39_mag"

// Magazines for 30Rnd 9x39mm soviet/russian weapons
#define MAGAZINES_RU939_30 "30Rnd_mas_9x39_mag", "20Rnd_mas_9x39_mag"

// Magazines for 30Rnd 9x39mm underwater soviet/russian weapons
#define MAGAZINES_RU939_UW "30Rnd_mas_9x39d_mag", "30Rnd_mas_9x39_mag", "20Rnd_mas_9x39_mag"
                           
// Magazines for the Bizon
#define MAGAZINES_Bizon "64Rnd_mas_9x18_mag"
                           
// Magazines for the Saiga 12K
#define MAGAZINES_Saiga "hlc_10rnd_12g_buck_S12", "hlc_10rnd_12g_slug_S12", \
                        "10Rnd_mas_12Gauge_Slug", "10Rnd_mas_12Gauge_Pellets"
                        
// Magazines for the Benelli M4 Super 90 long
#define MAGAZINES_BenelliM4_L "prpl_8Rnd_12Gauge_Pellets", "prpl_8Rnd_12Gauge_Slug", "prpl_6Rnd_12Gauge_Pellets", "prpl_6Rnd_12Gauge_Slug"

// Magazines for the Benelli M4 Super 90 short
#define MAGAZINES_BenelliM4_S "prpl_6Rnd_12Gauge_Pellets", "prpl_6Rnd_12Gauge_Slug"

// Magazines for the Benelli M1014
#define MAGAZINES_BenelliM1014 "7Rnd_mas_12Gauge_Slug", "7Rnd_mas_12Gauge_Pellets"

// Magazines for the Mossberg 590A1 12-gauge pump Long
#define MAGAZINES_M590 "rhsusf_8Rnd_00Buck", "rhsusf_8rnd_doomsday_buck"

// Magazines for the Mossberg 590A1 12-gauge pump Short
#define MAGAZINES_M590_S "rhsusf_5Rnd_00Buck", "rhsusf_5rnd_doomsday_buck"
                        
// Magazines for the MP-443 russian pistol
#define MAGAZINES_MP443 "rhs_mag_9x19_17"

// Magazines for 12.7x108mm weapons
#define MAGAZINES_127 "5Rnd_mas_127x108_mag", "5Rnd_mas_127x108_dem_mag", "5Rnd_mas_127x108_T_mag", \
                      "5Rnd_127x108_Mag"
                        
// Rounds for the M203/M320 NATO grenade launcher
#define ROUNDS_M203 "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F", \
                    "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell", \
                    "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", \
                    "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M4009", "rhs_mag_m576", "rhs_mag_M585_white", "rhs_mag_M661_green", "rhs_mag_M662_red", \
                    "rhs_mag_M713_red", "rhs_mag_M714_white", "rhs_mag_M715_green", "rhs_mag_M716_yellow"
                    
// Rounds for the GP-25 soviet/russian grenade launcher
#define ROUNDS_GP25 "hlc_VOG25_AK", "hlc_GRD_White", "hlc_GRD_Red", "hlc_GRD_Green", "hlc_GRD_Yellow", "hlc_GRD_Purple", "hlc_GRD_Blue", "hlc_GRD_Orange", \
                    "rhs_VOG25", "rhs_VOG25p", "rhs_vg40tb", "rhs_vg40sz", "rhs_vg40op_white", "rhs_vg40op_green", "rhs_vg40op_red", "rhs_GRD40_white", "rhs_GRD40_green", "rhs_GRD40_red"
                    
// Rounds for all grenade launchers with priority on russian ammo (since massi's russian weapons use vanilla rounds)
#define ROUNDS_MAS_GL "hlc_VOG25_AK", "hlc_GRD_White", "hlc_GRD_Red", "hlc_GRD_Green", "hlc_GRD_Yellow", "hlc_GRD_Purple", "hlc_GRD_Blue", "hlc_GRD_Orange", \
                      "rhs_VOG25", "rhs_VOG25p", "rhs_vg40tb", "rhs_vg40sz", "rhs_vg40op_white", "rhs_vg40op_green", "rhs_vg40op_red", "rhs_GRD40_white", "rhs_GRD40_green", "rhs_GRD40_red", \
                      "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F", \
                      "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell", \
                      "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", \
                      "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M4009", "rhs_mag_m576", "rhs_mag_M585_white", "rhs_mag_M661_green", "rhs_mag_M662_red", \
                      "rhs_mag_M713_red", "rhs_mag_M714_white", "rhs_mag_M715_green", "rhs_mag_M716_yellow"