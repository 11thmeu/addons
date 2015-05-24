class 30Rnd_556x45_Stanag;
class MEU_30Rnd_STANAG4179_M855A1: 30Rnd_556x45_Stanag {
	MEU_AUTHORS;

		
	count = 30;
	mass = 8;

	picture = QUOTE(PATHTOF(UI\m_30_stanag4179_m855a1_ca.paa));
	displayName = "30Rnd STANAG M855A1";
	descriptionShort = "Enhanced Perfomance Round";
	displayNameShort = "M855A1";

	model = "\rhsusf\addons\rhsusf_weapons\magazines\rhs_stanag_mag";

	MAGAZINE_GROUP_STANAG4179;
};

class MEU_30Rnd_STANAG4179_M856A1: MEU_30Rnd_STANAG4179_M855A1 {
	MEU_AUTHORS;
	
	tracersEvery = 1;

	picture = QUOTE(PATHTOF(UI\m_30_stanag4179_m855a1_mt_ca.paa));
	displayName = "30Rnd STANAG M856A1 TR";
	descriptionShort = "Tracer";
	displayNameShort = "M856A1";

	MAGAZINE_GROUP_STANAG4179;
};

class MEU_30Rnd_STANAG4179_Mk262Mod1: 30Rnd_556x45_Stanag {
	MEU_AUTHORS;

	ammo = "MEU_B_556x45_Mk262Mod1";
	count = 30;
	mass = 8;

	picture = QUOTE(PATHTOF(UI\m_30_stanag4179_mk262_ca.paa));
	tracersEvery = 0;
	lastRoundsTracer = 30;
	displayName = "30Rnd STANAG Mk262 Mod 1";
	descriptionShort = "Special Ball LR";
	displayNameShort = "Mk262 Mod1";

	model = "\rhsusf\addons\rhsusf_weapons\magazines\rhs_stanag_mag";

	MAGAZINE_GROUP_STANAG4179;
};

class MEU_20Rnd_STANAG4179_Mk262Mod1: MEU_30Rnd_STANAG4179_Mk262Mod1 {
	MEU_AUTHORS;

	count = 20;
	mass = 6;

	picture = QUOTE(PATHTOF(UI\m_20_stanag4179_mk262_ca.paa));
	displayName = "20Rnd STANAG Mk262 Mod 1";
	descriptionShort = "Special Ball LR";
	displayNameShort = "Mk262 Mod1";

	MAGAZINE_GROUP_STANAG4179;
};

class MEU_100Rnd_BetaCMag: MEU_30Rnd_STANAG4179_M855A1 {
	MEU_AUTHORS;

	ammo = "MEU_B_556x45_M855A1EPR";
	count = 100;
	mass = 46;

	picture = QUOTE(PATHTOF(UI\m_100_stanag4179_m855a1_ca.paa));
	displayName = "100Rnd M855A1 C-Mag";
	descriptionShort = "Enhanced Perfomance Round";
	displayNameShort = "M855A1";

	MAGAZINE_GROUP_STANAG4179;
};

class MEU_200Rnd_M249_M855A1: MEU_30Rnd_STANAG4179_M855A1 {
	count = 200;
	mass = 58;

	picture = QUOTE(PATHTOF(UI\m_100_M249_m855a1.paa));
	displayName = "200Rnd M855A1 M249";
	descriptionShort = "Enhanced Perfomance Round";
	displayNameShort = "M855A1";
	model = "\rhsusf\addons\rhsusf_weapons\magazines\rhs_softpouch_mag";
	
	ACE_isBelt = 1;

	MAGAZINE_GROUP_M249;
};

class MEU_200Rnd_M249_M856A1: MEU_200Rnd_M249_M855A1 {
	tracersEvery = 1;
	mass = 58;

	ammo = "MEU_B_556x45_M856A1EPR";
	picture = QUOTE(PATHTOF(UI\m_100_M249_m856a1.paa));
	displayName = "200Rnd M856A1 M249";
	descriptionShort = "Tracer";
	displayNameShort = "M856A1";
	model = "\rhsusf\addons\rhsusf_weapons\magazines\rhs_softpouch_mag";

	ACE_isBelt = 1;

	MAGAZINE_GROUP_M249;
};

class MEU_100Rnd_M249_M855A1: MEU_30Rnd_STANAG4179_M855A1 {
	count = 100;
	mass = 33;

	picture = QUOTE(PATHTOF(UI\m_100_M249_m855a1.paa));
	displayName = "100Rnd M855A1 M249";
	descriptionShort = "Enhanced Perfomance Round";
	displayNameShort = "M855A1";
	model = "\rhsusf\addons\rhsusf_weapons\magazines\rhs_softpouch_mag";

	ACE_isBelt = 1;

	MAGAZINE_GROUP_M249;
};

class MEU_100Rnd_M249_M856A1: MEU_200Rnd_M249_M855A1 {
	tracersEvery = 1;
	mass = 33;

	ammo = "MEU_B_556x45_M856A1EPR";
	picture = QUOTE(PATHTOF(UI\m_100_M249_m856a1.paa));
	displayName = "100Rnd M856A1 M249";
	descriptionShort = "Tracer";
	displayNameShort = "M856A1";
	model = "\rhsusf\addons\rhsusf_weapons\magazines\rhs_softpouch_mag";

	ACE_isBelt = 1;
	
	MAGAZINE_GROUP_M249;
};