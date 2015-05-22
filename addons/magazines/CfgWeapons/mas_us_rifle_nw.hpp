class arifle_mas_mk16: arifle_mas_hk416
{
	magazines[] = {MAGAZINES_STANAG};
};

class arifle_mas_mk16_gl: arifle_mas_hk416_gl
{
	magazines[] = {MAGAZINES_STANAG};
	
	class EGLM: UGL_F
	{
		magazines[] = {ROUNDS_M203};
	};
};

class arifle_mas_mk17: arifle_mas_mk16
{
	magazines[] = {MAGAZINES_762};
};

class arifle_mas_mk17_gl: arifle_mas_mk16_gl
{
	magazines[] = {MAGAZINES_762};
};

class srifle_mas_mk17s: srifle_mas_hk417
{
	magazines[] = {MAGAZINES_762};
};