class B_9x21_Ball;
class MEU_B_9x19_M882: B_9x21_Ball {
	// ACE3
	ACE_BulletMass = 4.5; // temporary

	// Credits to Spartan0536
	hit = 5.359214173;
	typicalSpeed = 423;
	airFriction = -0.002393437;
	caliber = 0.531;
	deflecting = 28;
	visibleFire = 1.3;
	audibleFire = 4;

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

		// UW thingies
	timeToLive = 0.40; // that's enough for 45 meters underwater
	waterFriction = -0.00345426; // nearly direct line underwater
	effectFly = "AmmoUnderwater";
};

class MEU_B_9x19_HPP : MEU_B_9x19_M882 {
	// ACE3
	ACE_BulletMass = 4.5; // temporary

	// Credits to Spartan0536
	hit = 8.790347689;
	typicalSpeed = 416;
	airFriction = -0.002440235;
	caliber = 0.385;
	deflecting = 25;
	visibleFire = 1.3;
	audibleFire = 4;

	// UW thingies
	timeToLive = 0.40; // that's enough for 45 meters underwater
	waterFriction = -0.00345426; // nearly direct line underwater
	effectFly = "AmmoUnderwater";
};

class MEU_B_9x19_HP_S : MEU_B_9x19_HPP {
	// ACE3
	ACE_BulletMass = 4.5; // temporary

	// Credits to Spartan0536
	hit = 7.670762747;
	typicalSpeed = 333;
	airFriction = -0.00145426;
	caliber = 0.334;
	deflecting = 21;
	visibleFire = 1;
	audibleFire = 2;


	// UW thingies
	timeToLive = 0.12; // that's enough for 45 meters underwater
	waterFriction = -0.00345426; // nearly direct line underwater
	effectFly = "AmmoUnderwater";
};