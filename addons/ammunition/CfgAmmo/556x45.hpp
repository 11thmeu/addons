class B_556x45_Ball;
class MEU_B_556x45_M855A1EPR: B_556x45_Ball {
    // Credits to Spartan0536
    hit = 8.114581;
    typicalSpeed = 905.256;
    airFriction = -0.0011543788;
    caliber = 0.855;
    deflecting = 21;
    visibleFire = 3;
    audibleFire = 7;

    timeToLive = 3; // 1300m

    tracerStartTime = 0;
    tracerEndTime = 0;

    ACE_caliber = 5.69;
    ACE_bulletLength = 23.012;
    ACE_bulletMass = 4.0176;
    ACE_ammoTempMuzzleVelocityShifts[] = {-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};
    ACE_ballisticCoefficients[] = {0.151};
    ACE_velocityBoundaries[] = {};
    ACE_standardAtmosphere = "ASM";
    ACE_dragModel = 7;
    ACE_muzzleVelocities[] = {723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
    ACE_barrelLengths[] = {210.82, 238.76, 269.24, 299.72, 330.2, 360.68, 391.16, 419.1, 449.58, 480.06, 508.0, 609.6};
};

class MEU_B_556x45_M856A1EPR: B_556x45_Ball {
    // Credits to Spartan0536
    hit = 8.114581;
    typicalSpeed = 905.256;
    airFriction = -0.0011543788;
    caliber = 0.855;
    deflecting = 21;
    visibleFire = 3;
    audibleFire = 7;

    timeToLive = 2; // 814m aprox
    tracerStartTime = 0.073;
    tracerEndTime = 1.579;

    ACE_caliber = 5.69;
    ACE_bulletLength = 23.012;
    ACE_bulletMass = 4.0176;
    ACE_ammoTempMuzzleVelocityShifts[] = {-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};
    ACE_ballisticCoefficients[] = {0.151};
    ACE_velocityBoundaries[] = {};
    ACE_standardAtmosphere = "ASM";
    ACE_dragModel = 7;
    ACE_muzzleVelocities[] = {723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
    ACE_barrelLengths[] = {210.82, 238.76, 269.24, 299.72, 330.2, 360.68, 391.16, 419.1, 449.58, 480.06, 508.0, 609.6};
};

class MEU_B_556x45_Mk262Mod1: MEU_B_556x45_M855A1EPR {
    // Credits to Spartan0536
    hit = 11.5702505;
    visibleFire = 2.5;
    audibleFire = 5;

    timeToLive = 3; // 1600m

    airFriction = -0.001125;
    caliber = 0.8;
    deflecting = 18;
    typicalSpeed = 836;
    ACE_caliber = 5.69;
    ACE_bulletLength = 23.012;
    ACE_bulletMass = 4.9896;
    ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
    ACE_ballisticCoefficients[] = {0.361};
    ACE_velocityBoundaries[] = {};
    ACE_standardAtmosphere = "ASM";
    ACE_dragModel = 1;
    ACE_muzzleVelocities[] = {624, 816, 832, 838};
    ACE_barrelLengths[] = {190.5, 368.3, 457.2, 508.0};
};

class MEU_B_556x45_SimunitionFX: B_556x45_Ball {

    hit = 0;
    typicalSpeed = 198; // http://en.wikipedia.org/wiki/Simunition
    airFriction = -0.0011543788;
    caliber = 0.855;
    deflecting = 21;
    visibleFire = 3;
    visiblefiretime = 7;
    audibleFire = 0;

    timeToLive = 0.9; // 180m aprox

    // TODO SIMUNITION Ballistic Coef and speeds

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