class CfgWeapons
{
    class Rifle;
    class Pistol_Base_F;
    class Rifle_Base_F: Rifle
    {
        class WeaponSlotsInfo;
    };
    class Rifle_Long_Base_F: Rifle_Base_F {};
    class hgun_Rook40_F;
    class hgun_PDW2000_F;
    class lrr_base_F;
    class GM6_base_F;
    class arifle_MX_Base_F;
    class arifle_MX_F: arifle_MX_Base_F {};
    class arifle_MX_GL_F: arifle_MX_Base_F {};
    class mk20_base_F;
    class arifle_Katiba_F;
    class arifle_Katiba_GL_F;
    class srifle_GM6_F;
    class srifle_LRR_F;
    class LMG_Mk200_F;
    class SMG_02_F;
    class UGL_F;
    class Binocular;
    class EBR_base_F;

    #include "CfgWeapons\vanilla.hpp"
    #include "CfgWeapons\hlc_wp_ak.hpp"
    #include "CfgWeapons\hlc_wp_ar15.hpp"
    #include "CfgWeapons\hlc_wp_fal.hpp"
    #include "CfgWeapons\hlc_wp_g3.hpp"
    #include "CfgWeapons\hlc_wp_m14.hpp"
    #include "CfgWeapons\hlc_wp_m60e4.hpp"
    #include "CfgWeapons\hlc_wp_mp5.hpp"
    #include "CfgWeapons\rh_m4.hpp"
    #include "CfgWeapons\rhard_mk18.hpp"
    #include "CfgWeapons\rhs.hpp"
    #include "CfgWeapons\rhsusf.hpp"
};
