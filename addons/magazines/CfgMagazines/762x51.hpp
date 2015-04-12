class 20Rnd_762x51_Mag;
class MEU_20Rnd_MK11_M80A1: 20Rnd_762x51_Mag {
	MEU_AUTHORS;

	ammo = "MEU_B_762x51_M80A1";
	count = 20;

	picture="\11th_weapons\data\ui\m_20_mk11_m80_ca.paa";
	displayName = "20Rnd M80A1 Mk11";
	descriptionShort = "$STR_MEU_Weapons_20Rnd_MK11_M80";
	displayNameShort = "M80A1";

	MAGAZINE_GROUP_MK11;
};

class MEU_20Rnd_MK11_M80A1_T: MEU_20Rnd_MK11_M80 {
	MEU_AUTHORS;

	ammo = "MEU_B_762x51_M80A1";
	count = 20;
	tracersEvery = 3;

	picture="\11th_weapons\data\ui\m_20_mk11_m80_ft_ca.paa";
	displayName = "20Rnd M80A1 Mk11 Tracer";
	descriptionShort = "$STR_MEU_Weapons_20Rnd_MK11_M80_FT";
	displayNameShort = "M80A1 T";

	MAGAZINE_GROUP_MK11;
};

class MEU_20Rnd_MK11_M118LR: 20Rnd_762x51_Mag {
	ammo = "AGM_B_762x51_M118LR";
	count = 20;

	picture="\11th_weapons\data\ui\m_20_mk11_m118lr_ca.paa";
	displayName = "20Rnd M118LR Mk11";
	descriptionShort = "$STR_MEU_Weapons_20Rnd_MK11_M118LR";
	displayNameShort = "7.62mm";

	MAGAZINE_GROUP_MK11;
};

class MEU_20Rnd_MK11_Mk316Mod0: 20Rnd_762x51_Mag {
	
	ammo = "MEU_B_762x51_Mk316Mod0";
	count = 20;

	picture="\11th_weapons\data\ui\m_20_mk11_mk316mod0_ca.paa";
	displayName = "20Rnd Mk316 Mod 0 Mk11";
	descriptionShort = "$STR_MEU_Weapons_20Rnd_MK11_Mk316Mod0";
	displayNameShort = "7.62mm";

	MAGAZINE_GROUP_MK11;
};

class MEU_20Rnd_MK11_LapuaFMJBTSub: 20Rnd_762x51_Mag {
	ammo = "MEU_B_762x51_LapuaFMJBTSub";
	count = 20;

	picture="\11th_weapons\data\ui\m_20_mk11_lapuafmjbtsub_ca.paa";
	displayName = "20Rnd Lapua FMJBT Subsonic Mk11";
	descriptionShort = "$STR_MEU_Weapons_20Rnd_MK11_LapuaFMJBTSub";
	displayNameShort = "7.62mm";

	MAGAZINE_GROUP_MK11;
};

class MEU_20Rnd_M14_M80: MEU_20Rnd_MK11_M80 {
	picture="\11th_weapons\data\ui\m_20_m14_m80_ca.paa";
	displayName = "20Rnd M80 M14";
	descriptionShort = "$STR_MEU_Weapons_20Rnd_M14_M80";
	displayNameShort = "7.62mm";

	magazineGroup[] = {"MEU_M14"};
};

class MEU_20Rnd_M14_Mk316Mod0: MEU_20Rnd_MK11_Mk316Mod0 {
	picture="\11th_weapons\data\ui\m_20_m14_mk316mod0_ca.paa";
	displayName = "20Rnd Mk 316 Mod 0 M14";
	descriptionShort = "$STR_MEU_Weapons_20Rnd_M14_Mk316Mod0";
	displayNameShort = "7.62mm";

	magazineGroup[] = {"MEU_M14"};
};

class MEU_20Rnd_M14_Mk319Mod0: MEU_20Rnd_MK11_Mk319Mod0 {
	picture="\11th_weapons\data\ui\m_20_m14_mk319mod0_ca.paa";
	displayName = "20Rnd Mk 319 Mod 0 M14";
	descriptionShort = "$STR_MEU_Weapons_20Rnd_M14_Mk319Mod0";
	displayNameShort = "7.62mm";

	magazineGroup[] = {"MEU_M14"};
};

class MEU_20Rnd_M14_LapuaFMJBTSub: MEU_20Rnd_MK11_LapuaFMJBTSub {
	picture="\11th_weapons\data\ui\m_20_m14_lapuafmjbtsub_ca.paa";
	displayName = "20Rnd Lapua FMJBT Subsonic M14";
	descriptionShort = "$STR_MEU_Weapons_20Rnd_M14_LapuaFMJBTSub";
	displayNameShort = "7.62mm";

	magazineGroup[] = {"MEU_M14"};
};

class MEU_5Rnd_M40_M80: MEU_20Rnd_MK11_M80 {
	count = 5;

	picture="\11th_weapons\data\ui\m_5_m40_m80_ca.paa";
	displayName = "5Rnd M80 M40";
	descriptionShort = "$STR_MEU_Weapons_5Rnd_M40_M80";
	displayNameShort = "7.62mm";

	magazineGroup[] = {"MEU_M40"};
};

class MEU_5Rnd_M40_Mk316Mod0: MEU_20Rnd_MK11_Mk316Mod0 {
	count = 5;

	picture="\11th_weapons\data\ui\m_5_m40_mk316mod0_ca.paa";
	displayName = "5Rnd Mk 316 Mod 0 M40";
	descriptionShort = "$STR_MEU_Weapons_5Rnd_M40_Mk316Mod0";
	displayNameShort = "7.62mm";

	magazineGroup[] = {"MEU_M40"};
};

class MEU_5Rnd_Bullet_M80: MEU_5Rnd_M40_M80 {
	count = 5;

	picture="\11th_weapons\data\ui\m_5_bullet_m80_ca.paa";
	displayName = "5Rnd M80 Bullets";
	descriptionShort = "$STR_MEU_Weapons_5Rnd_Bullet_M80";
	displayNameShort = "7.62mm";

	magazineGroup[] = {"MEU_762Bullets"};
};

class MEU_5Rnd_Bullet_Mk316Mod0: MEU_5Rnd_M40_Mk316Mod0 {
	count = 5;

	picture="\11th_weapons\data\ui\m_5_bullet_mk316mod0_ca.paa";
	displayName = "5Rnd Mk316 Mod 0 Bullets";
	descriptionShort = "$STR_MEU_Weapons_5Rnd_Bullet_Mk316Mod0";
	displayNameShort = "7.62mm";

	magazineGroup[] = {"MEU_762Bullets"};
};

//-------------------------------------------------
//Unused
//-------------------------------------------------

class MEU_20Rnd_M14_M118LR: MEU_20Rnd_MK11_M118LR {
	count = 20;

	picture="\11th_weapons\data\ui\m_20_m14_m118lr_ca.paa";
	displayName = "20Rnd M118LR M14";
	descriptionShort = "20Rnd M118LR";
	displayNameShort = "20Rnd M118LR";

	magazineGroup[] = {"MEU_M14"};
};

class MEU_5Rnd_M40_M118LR: MEU_20Rnd_MK11_M118LR {
	count = 5;

	picture="\11th_weapons\data\ui\m_5_m40_m118lr_ca.paa";
	displayName = "5Rnd M118LR M40";
	descriptionShort = "5Rnd M118LR";
	displayNameShort = "5Rnd M118LR";

	magazineGroup[] = {"MEU_M40"};
};

class MEU_5Rnd_Bullet_M118LR: MEU_20Rnd_MK11_M118LR {
	count = 5;

	picture="\11th_weapons\data\ui\m_5_bullet_m118lr_ca.paa";
	displayName = "5Rnd M118LR Bullets";
	descriptionShort = "5Rnd M118LR";
	displayNameShort = "5Rnd M118LR";

	magazineGroup[] = {"MEU_762Bullets"};
};