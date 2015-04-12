class MEU_B_45ACP_FMJ: B_9x21_Ball {
	// ACE3
	ACE_BulletMass = 5.1; // temporary

	// Credits to Spartan0536
	hit = 5.317573216;
	typicalSpeed = 307.5432;
	airFriction = -0.001070194;
	caliber = 0.492;
	deflecting = 25;
	visibleFire = 1;
	audibleFire = 2.5;

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

class MEU_B_45ACP_JHP: MEU_B_45ACP_FMJ {
	// ACE3
	ACE_BulletMass = 5.1; // temporary

	// Credits to Spartan0536
	hit = 9.466891709;
	typicalSpeed = 328.8792;
	airFriction = -0.001389745;
	caliber = 0.401;
	deflecting = 21;
	visibleFire = 1.15;
	audibleFire = 2.65;
};