//HLC AR15
class hlc_ar15_base: Rifle_Base_F 
{
	magazines[] = {MAGAZINES_STANAG};
};

class hlc_rifle_RU556: hlc_ar15_base 
{
	magazines[] = {MAGAZINES_STANAG};

	//Advanced Ballistics
	AB_barrelTwist = 7;
	AB_twistDirection = 1;
	AB_barrelLength = 9;
};
class hlc_rifle_RU5562: hlc_rifle_RU556 
{
	magazines[] = {MAGAZINES_STANAG};
};
class hlc_rifle_bcmjack: hlc_ar15_base 
{
	magazines[] = {MAGAZINES_STANAG};
};
class hlc_rifle_Colt727: hlc_ar15_base 
{
	magazines[] = {MAGAZINES_STANAG};
};
class hlc_rifle_SAMR: hlc_rifle_RU556 
{
	magazines[] = {MAGAZINES_STANAG_LR};
};
class hlc_rifle_CQBR: hlc_rifle_RU556 
{
	magazines[] = {MAGAZINES_STANAG};
};

class hlc_rifle_M4: hlc_rifle_RU556 
{
	magazines[] = {MAGAZINES_STANAG};
};
class hlc_rifle_Bushmaster300: hlc_rifle_Colt727
{
	magazines[] = {MAGAZINES_300};
};
class hlc_rifle_vendimus: hlc_rifle_Bushmaster300
{
	magazines[] = {MAGAZINES_300};
};
class hlc_rifle_honeybase: hlc_rifle_RU556
{
	magazines[] = {MAGAZINES_300};
};