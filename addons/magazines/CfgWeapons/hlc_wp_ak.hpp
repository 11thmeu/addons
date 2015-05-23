class hlc_ak_base;
class hlc_rifle_ak74: hlc_ak_base
{
	magazines[] = {MAGAZINES_RU545};
};

class hlc_rifle_ak47: hlc_rifle_ak74
{
	magazines[] = {MAGAZINES_RU762};
};

class hlc_rifle_akm: hlc_rifle_ak47 {};
class hlc_rifle_akmgl: hlc_rifle_akm
{
	class hlc_GP25_AKM: UGL_F
	{
		magazines[] = {ROUNDS_GP25};
	};
};

class hlc_rifle_rpk: hlc_rifle_ak47
{
	magazines[] = {MAGAZINES_RU762_MG};
	
	AGM_Overheating_allowSwapBarrel = 1; 
};	

class hlc_rifle_aks74: hlc_rifle_ak74 {};
class hlc_rifle_aks74_GL: hlc_rifle_aks74
{
	class hlc_GP30_AKS74: UGL_F
	{
		magazines[] = {ROUNDS_GP25};
	};
};

class hlc_rifle_ak12: hlc_ak_base {};
class hlc_rifle_RPK12: hlc_rifle_ak12
{
	magazines[] = {MAGAZINES_RU545_MG};
	
	AGM_Overheating_allowSwapBarrel = 1; 
};

class hlc_rifle_saiga12k: hlc_rifle_ak47
{
	magazines[] = {MAGAZINES_Saiga};
};

class hlc_rifle_ak12GL: hlc_rifle_ak12
{
	class hlc_GP30_AK12: UGL_F
	{
		magazines[] = {ROUNDS_GP25};
	};
};