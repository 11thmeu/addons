class RH_ar10: Rifle_Base_F
{
	magazines[] = {MAGAZINES_AR10};
};

class RH_m110: Rifle_Base_F
{
	magazines[] = {MAGAZINES_762_LR};
	
	AGM_Bipod = 1;
};

class RH_SR25EC: RH_m110
{
	magazines[] = {MAGAZINES_SR25};
	
	AGM_Bipod = 1;
};

class RH_m4: Rifle_Base_F
{
	magazines[] = {MAGAZINES_STANAG};
	
	class M203: UGL_F
	{
		magazines[] = {ROUNDS_M203};
	};
};

class RH_hb: Rifle_Base_F
{
	magazines[] = {MAGAZINES_300};
};

class RH_sbr9: Rifle_Base_F
{
	magazines[] = {MAGAZINES_MP5};
};

class RH_M4A1_ris;
class RH_M4sbr: RH_M4A1_ris
{
};

class RH_M16a1: RH_m4
{
};

class RH_M16A2: RH_m4 
{
};

class RH_M4_ris: RH_m4 {};
class RH_M16A4: RH_M4_ris 
{
};

class RH_M4A6: RH_M4A1_ris
{
	magazines[] = {MAGAZINES_68x43};
};

class RH_M16A6: RH_M16A4
{
	magazines[] = {MAGAZINES_68x43};
};

class RH_Mk12mod1: RH_M16A4
{
	magazines[] = {MAGAZINES_STANAG_LR};
};

class RH_M27IAR: RH_Mk12mod1
{
	magazines[] = {MAGAZINES_IAR};
};