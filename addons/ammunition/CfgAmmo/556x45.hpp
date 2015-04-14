class B_556x45_Ball;
class MEU_B_556x45_M855A1EPR: B_556x45_Ball {
	// ACE3
	ACE_BulletMass = 4.1;

	// Credits to Spartan0536
	hit = 8.114581;
	typicalSpeed = 905.256;
	airFriction = -0.0011543788;
	caliber = 0.855;
	deflecting = 21;
	visibleFire = 3;
	audibleFire = 7;

	// AdvancedBallistics
	/*AB_caliber = 0.224;
	AB_bulletLength = 0.906;
	AB_bulletMass = 62;
	AB_ammoTempMuzzleVelocityData[] = {-91,-86,-78,-68,-57,-42,-23,0,29,65,110}; // ND
	AB_ballisticCoefficients[] = {0.307};
	AB_velocityBoundaries[] = {};
	AB_standardAtmosphere = "ASM";
	AB_dragModel = 1;
	AB_muzzleVelocities[] = {747,807,850,868,884,905,911,923,953,962,970,985};
	AB_barrelLengths[] = {7,9,11,12,13,14,15,16,19,20,21,23,24};*/
};

class MEU_B_556x45_Mk262Mod1: MEU_B_556x45_M855A1EPR {
	// ACE3
	ACE_BulletMass = 4.4;

	// Credits to Spartan0536
	hit = 11.5702505;
	typicalSpeed = 868.68;
	airFriction = -0.0010867938;
	caliber = 0.615;
	deflecting = 16;
	visibleFire = 2.5;
	audibleFire = 5;

	// AdvancedBallistics
	/*AB_bulletMass = 77;
	AB_ammoTempMuzzleVelocityData[] = {-91,-86,-78,-68,-57,-42,-23,0,29,65,110}; // ND
	AB_ballisticCoefficients[] = {0.340};
	AB_velocityBoundaries[] = {};
	AB_standardAtmosphere = "ASM";
	AB_dragModel = 1;
	AB_muzzleVelocities[] = {723,764,780,808,820,831,851,859,867,875,889};
	AB_barrelLengths[] = {9,11,12,14,15,16,18,19,20,21,23,24};*/
};

class MEU_B_556x45_SimunitionFX: B_556x45_Ball {
	// ACE
	ACE_BulletMass = 2;

	hit = 0;
	typicalSpeed = 905.256;
	airFriction = -0.0011543788;
	caliber = 0.855;
	deflecting = 21;
	visibleFire = 3;
	visiblefiretime = 7;
	audibleFire = 0;

	hitMan[] = {};
	bulletfly[] = {};
	hitarmor[] = {};
	hitbuilding[] = {};
	hitconcrete[] = {};
	hitdefault[] = {};
	hitfoliage[] = {};
	hitglass[] = {};
	hitglassarmored[] = {};
	hitgroundhard[] = {};
	hitgroundsoft[] = {};
	hitiron[] = {};
	hitmetal[] = {};
	hitmetalplate[] = {};
	hitplastic[] = {};
	hitrubber[] = {};
	hitwood[] = {};
	hitground[] = {};

	class HitEffects {
		hit_blood = "";
		hit_concrete = "";
		hit_foliage = "";
		hit_foliage_green = "";
		hit_glass = "";
		hit_glass_thin = "";
		hit_metal = "";
		hit_plaster = "";
		hit_rubber = "";
		hit_wood = "";
	};
};