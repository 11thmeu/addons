class B_556x45_Ball;
class MEU_B_556x45_M855A1EPR: B_556x45_Ball {
    // Credits to Spartan0536
    hit = 8.114581;
    caliber = 0.855;
    deflecting = 21;
    visibleFire = 3;
    audibleFire = 7;
};

class ACE_556x45_Ball_Mk262;
class MEU_B_556x45_Mk262Mod1: ACE_556x45_Ball_Mk262 {
    // Credits to Spartan0536
    hit = 11.5702505;
    visibleFire = 2.5;
    audibleFire = 5;
    caliber = 0.8;
    deflecting = 18;
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