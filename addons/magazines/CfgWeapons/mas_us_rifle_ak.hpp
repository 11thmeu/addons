class arifle_mas_ak_74m: arifle_Katiba_F
{
	magazines[] = {MAGAZINES_RU545};
};

class arifle_mas_ak_74m_gl: arifle_Katiba_GL_F
{
	magazines[] = {MAGAZINES_RU545};
	
	class GP30: UGL_F
	{
		magazines[] = {ROUNDS_MAS_GL};
	};
};

class arifle_mas_akms: arifle_mas_ak_74m
{
	magazines[] = {MAGAZINES_RU762};
};

class arifle_mas_akms_gl: arifle_mas_ak_74m_gl
{
	magazines[] = {MAGAZINES_RU762};
};

class arifle_mas_akm_gl: arifle_mas_akms_gl
{
	magazines[] = {MAGAZINES_RU762};
};

class arifle_mas_m70_gl: arifle_mas_akm_gl
{
	magazines[] = {MAGAZINES_RU762};
};

class arifle_mas_m70ab_gl: arifle_mas_akms_gl
{
	magazines[] = {MAGAZINES_RU762};
};

class srifle_mas_svd: srifle_EBR_F
{
	magazines[] = {MAGAZINES_RU762x54_LR};
};

class srifle_mas_m91: srifle_mas_svd
{
	magazines[] = {MAGAZINES_RU762x54_LR};
};

class srifle_mas_vss: srifle_mas_svd
{
	magazines[] = {MAGAZINES_RU939};
};

class srifle_mas_ksvk: srifle_GM6_F
{
	magazines[] = {MAGAZINES_127};
	
	AGM_Bipod = 1;
};

class LMG_mas_rpk_F: LMG_Mk200_F
{
	magazines[] = {MAGAZINES_RU545_MG};
	
	AGM_Bipod = 1;
};

class LMG_mas_m72_F: LMG_mas_rpk_F
{
	magazines[] = {MAGAZINES_RU762_MG};
	
	AGM_Bipod = 1;
};

class LMG_mas_pkm_F: LMG_Mk200_F
{
	magazines[] = {MAGAZINES_RU762x54_MG};
	
	AGM_Bipod = 1;
};

class arifle_mas_aks74u: arifle_Katiba_F
{
	magazines[] = {MAGAZINES_RU545};
};

class arifle_mas_bizon: arifle_mas_aks74u
{
	magazines[] = {MAGAZINES_Bizon};
};

class arifle_mas_asval: arifle_mas_aks74u
{
	magazines[] = {MAGAZINES_RU939_30};
};

class arifle_mas_asval_ds: arifle_mas_asval
{
	magazines[] = {MAGAZINES_RU939_UW};
};

class arifle_mas_saiga: arifle_mas_ak_74m
{
	magazines[] = {MAGAZINES_Saiga};
};