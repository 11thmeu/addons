class CfgWeapons {
	class GrenadeLauncher;

	class Throw: GrenadeLauncher {
		muzzles[] += {"MEU_EX2MOD0_Red_Muzzle", "MEU_EX2MOD0_Green_Muzzle", "MEU_EX2MOD0_Yellow_Muzzle"};

		class ThrowMuzzle;
		class MEU_EX2MOD0_Red_Muzzle: ThrowMuzzle {
			magazines[] = {"MEU_EX2MOD0_Red"};
		};

		class MEU_EX2MOD0_Green_Muzzle: ThrowMuzzle {
			magazines[] = {"MEU_EX2MOD0_Green"};
		};

		class MEU_EX2MOD0_Yellow_Muzzle: ThrowMuzzle {
			magazines[] = {"MEU_EX2MOD0_Yellow"};
		};
	};
};