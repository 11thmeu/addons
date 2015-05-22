class rhs_weap_pya: hgun_Rook40_F
{
	magazines[] = {MAGAZINES_MP443};
};

class rhs_weap_ak74m_Base_F;
class rhs_weap_ak74m: rhs_weap_ak74m_Base_F
{
	magazines[] = {MAGAZINES_RU545};
	class GP25Muzzle: UGL_F
	{
		magazines[] = {ROUNDS_GP25};
	};
};

class rhs_weap_akm: rhs_weap_ak74m
{
	magazines[] = {MAGAZINES_RU762};
};

class rhs_weap_svd: rhs_weap_ak74m
{
	magazines[] = {MAGAZINES_RU762x54_LR};
};

class rhs_pkp_base;
class rhs_weap_pkp: rhs_pkp_base
{
	magazines[] = {MAGAZINES_RU762x54_MG};
	
	AGM_Bipod = 1;
};

class rhs_weap_rpk74m: rhs_weap_pkp
{
	magazines[] = {MAGAZINES_RU545_MG};
};