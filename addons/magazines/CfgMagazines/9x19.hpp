
// MP5 magazines
class 30Rnd_9x21_Mag;
class MEU_30Rnd_MP5_M882: 30Rnd_9x21_Mag {
	MEU_AUTHORS;

	ammo = "MEU_B_9x19_M882";
	count = 30;
	mass = 10;

	picture = QUOTE(PATHTOF(UI\m_30_mp5_m882_ca.paa));
	displayName = "30Rnd MP5 M882";
	descriptionShort = "$STR_MEU_Magazines_30Rnd_MP5_M882";
	displayNameShort = "M882";

	MAGAZINE_GROUP_MP5_9MM;
};

class MEU_30Rnd_MP5_HPP: MEU_30Rnd_MP5_M882 {
	MEU_AUTHORS;

	ammo = "MEU_B_9x19_HPP";
	count = 30;
	mass = 10;

	picture = QUOTE(PATHTOF(UI\m_30_mp5_hpp_ca.paa));
	displayName = "30Rnd MP5 HPP";
	descriptionShort = "$STR_MEU_Magazines_30Rnd_MP5_HPP";
	displayNameShort = "9x19mm HPP";

	MAGAZINE_GROUP_MP5_9MM;
};

class MEU_30Rnd_MP5_HP_S: MEU_30Rnd_MP5_M882 {
	MEU_AUTHORS;

	ammo = "MEU_B_9x19_HP_S";
	count = 30;
	mass = 10;

	picture = QUOTE(PATHTOF(UI\m_30_mp5_hp_s_ca.paa));
	displayName = "30Rnd MP5 HP Subsonic";
	descriptionShort = "$STR_MEU_Magazines_30Rnd_MP5_HP_S";
	displayNameShort = "9x19mm HP S";

	MAGAZINE_GROUP_MP5_9MM;
};
