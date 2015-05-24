class ACE_9x19_Ball;
class MEU_B_9x19_M882: ACE_9x19_Ball {

	// Credits to Spartan0536
	hit = 5.359214173;
	typicalSpeed = 423;
	airFriction = -0.002393437;
	caliber = 0.531;
	deflecting = 28;
	visibleFire = 1.3;
	audibleFire = 4;


		// UW thingies
	timeToLive = 0.80; // that's enough for 45 meters underwater
	waterFriction = -0.00345426; // nearly direct line underwater
	effectFly = "AmmoUnderwater";
};

class MEU_B_9x19_HPP : MEU_B_9x19_M882 {
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
	// Credits to Spartan0536
	hit = 7.670762747;
	typicalSpeed = 333;
	airFriction = -0.00145426;
	caliber = 0.334;
	deflecting = 21;
	visibleFire = 1;
	audibleFire = 2;

	supersonicCrackFar[] = {};
	supersonicCrackNear[] = {};


	// UW thingies
	timeToLive = 0.12; // that's enough for 45 meters underwater
	waterFriction = -0.00345426; // nearly direct line underwater
	effectFly = "AmmoUnderwater";
};