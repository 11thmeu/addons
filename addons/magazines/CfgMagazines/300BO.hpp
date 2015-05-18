class MEU_29Rnd_STANAG300_OTM: 30Rnd_556x45_Stanag {
	MEU_AUTHORS;

	ammo = "MEU_B_300BO_OTM";
	count = 29;
	mass = 16;

	picture = QUOTE(PATHTOF(UI\m_29_300bootm_ca.paa));
	displayName = "29Rnd .300AAC OTM Mag";
	descriptionShort = "$STR_MEU_Magazines_29_STANAG300_OTM";
	displayNameShort = ".300AAC";

	MAGAZINE_GROUP_300BO;
};

class MEU_29Rnd_STANAG300_OTM_S: MEU_29Rnd_STANAG300_OTM {
	MEU_AUTHORS;

	ammo = "MEU_B_300BO_OTM_S";
	count = 29;
	mass = 16;

	picture = QUOTE(PATHTOF(UI\m_29_300bootm_s_ca.paa));
	displayName = "29Rnd .300AAC OTM Subsonic Mag";
	descriptionShort = "$STR_MEU_Magazines_29_STANAG300_OTM_S";
	displayNameShort = ".300AAC";

	MAGAZINE_GROUP_300BO;
};