class HLC_300Blackout_Ball;
class MEU_B_300BO_OTM: HLC_300Blackout_Ball {
	// ACE
	ACE_BulletMass = 9;

	// Credits to Spartan0536
	hit = 10.82971547;
	typicalSpeed = 655;
	airFriction = -0.001118505;
	caliber = 0.417;
	deflecting = 17;

	// AdvancedBallistics
	/*AB_caliber = 0.308;
	AB_bulletLength = 1.1; // guessed need more info
	AB_bulletMass = 125;
	AB_ammoTempMuzzleVelocityData[] = {-91,-86,-78,-68,-57,-42,-23,0,29,65,110}; // ND
	AB_ballisticCoefficients[] = {0.320};
	AB_velocityBoundaries[] = {};
	AB_standardAtmosphere = "ASM";
	AB_dragModel = 1;
	AB_muzzleVelocities[] = {601,644,676,690,701,712,722,730,752,759}; // this seems too high
	AB_barrelLengths[] = {7,9,11,12,13,14,15,16,19,20,21};*/
};

class MEU_B_300BO_OTM_S: HLC_300Blackout_Ball {
	// ACE
	ACE_BulletMass = 9;

	// Credits to Spartan0536
	hit = 6.393114377;
	typicalSpeed = 290;
	airFriction = -0.00028133;
	caliber = 0.602;
	deflecting = 14;
	visibleFire = 1.25;
	audibleFire = 2.50;

	/*// AdvancedBallistics
	AB_caliber = 0.308;
	AB_bulletLength = 1.1; // guessed need more info
	AB_bulletMass = 125;
	AB_ammoTempMuzzleVelocityData[] = {-91,-86,-78,-68,-57,-42,-23,0,29,65,110}; // ND
	AB_ballisticCoefficients[] = {0.320};
	AB_velocityBoundaries[] = {};
	AB_standardAtmosphere = "ASM";
	AB_dragModel = 1;
	AB_muzzleVelocities[] = {601,644,676,690,701,712,722,730,752,759}; // this seems too high
	AB_barrelLengths[] = {7,9,11,12,13,14,15,16,19,20,21};*/
};