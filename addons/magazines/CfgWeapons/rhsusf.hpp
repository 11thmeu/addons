class rhs_weap_M320_Base_F: Pistol_Base_F
{
	magazines[] = {ROUNDS_M203};
};

class rhs_weap_XM2010_Base_F: Rifle_Base_F
{
	magazines[] = {MAGAZINES_XM2010};
};

class rhs_weap_m4_Base: arifle_MX_Base_F
{
	magazines[] = {MAGAZINES_STANAG};
	
	class M203_GL: UGL_F
	{
		magazines[] = {ROUNDS_M203};
	};
};

class rhs_weap_M249_base: LMG_Mk200_F
{
	magazines[] = {MAGAZINES_STANAG_MG};
};
class rhs_M249_base;
class weap_m240_base: rhs_M249_base
{
	magazines[] = {MAGAZINES_762_MG};
};

class rhs_weap_m14ebrri: srifle_EBR_F
{
	magazines[] = {MAGAZINES_M14};
};

class rhs_weap_sr25: rhs_weap_m14ebrri
{
	magazines[] = {MAGAZINES_SR25};
};

class rhs_weap_M590_5RD: Rifle_Base_F
{
	magazines[] = {MAGAZINES_M590_S};
};

class rhs_weap_M590_8RD: rhs_weap_M590_5RD
{
	magazines[] = {MAGAZINES_M590};
};