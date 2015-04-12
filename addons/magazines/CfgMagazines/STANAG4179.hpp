class 30Rnd_556x45_Stanag;
class MEU_30Rnd_STANAG4179_M855A1: 30Rnd_556x45_Stanag {
	MEU_AUTHORS;

	ammo = "MEU_B_556x45_M855A1EPR";
	count = 30;
	mass = 8;

	picture = PATHTOF(UI\m_30_stanag4179_m855a1_ca.paa);
	displayName = "30Rnd STANAG M855A1";
	descriptionShort = "$STR_MEU_Magazines_30Rnd_STANAG4179_M855A1EPR";
	displayNameShort = "M855A1";

	MAGAZINE_GROUP_STANAG4179;
};

class MEU_30Rnd_STANAG4179_M856A1: MEU_30Rnd_STANAG4179_M855A1 {
	MEU_AUTHORS;

	tracersEvery = 3;

	picture = PATHTOF(ui\m_30_stanag4179_m855a1_mt_ca.paa);
	displayName = "30Rnd STANAG M856A1 TR";
	descriptionShort = "$STR_MEU_Magazines_30Rnd_STANAG4179_M855A1EPR_MT";
	displayNameShort = "M856A1";

	MAGAZINE_GROUP_STANAG4179;
};

class MEU_30Rnd_STANAG4179_Mk262Mod1: 30Rnd_556x45_Stanag {
	MEU_AUTHORS;

	ammo = "MEU_B_556x45_Mk262Mod1";
	count = 30;
	mass = 8;

	picture = PATHTOF(ui\m_30_stanag4179_mk262_ca.paa);
	tracersEvery = 0;
	lastRoundsTracer = 30;
	displayName = "30Rnd STANAG Mk262 Mod 1";
	descriptionShort = "$STR_MEU_Magazines_30Rnd_STANAG4179_Mk262Mod1";
	displayNameShort = "Mk262Mod1";

	MAGAZINE_GROUP_STANAG4179;
};

class MEU_20Rnd_STANAG4179_Mk262Mod1: MEU_30Rnd_STANAG4179_Mk262Mod1 {
	MEU_AUTHORS;

	count = 20;
	mass = 6;

	picture = PATHTOF(ui\m_20_stanag4179_mk262_ca.paa);
	displayName = "20Rnd STANAG Mk262 Mod 1";
	descriptionShort = "$STR_MEU_Magazines_20Rnd_STANAG4179_Mk262Mod1";
	displayNameShort = "Mk262Mod1";

	MAGAZINE_GROUP_STANAG4179;
};

class MEU_100Rnd_BetaCMag: MEU_30Rnd_STANAG4179_M855A1EPR {
	MEU_AUTHORS;
	
	ammo = "MEU_B_556x45_M855A1EPR";
	count = 100;
	mass = 46;

	picture = "\11th_weapons\data\ui\m_100_stanag4179_m855a1_ca.paa";
	displayName = "100Rnd 5.56x45mm Beta C-Mag";
	descriptionShort = "$STR_MEU_Weapons_100Rnd_BetaCMag";
	displayNameShort = "5.56mm";

	magazineGroup[] = {"MEU_STANAG4179"};
};