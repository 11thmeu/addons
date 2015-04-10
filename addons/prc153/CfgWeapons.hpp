#include "\task_force_radio_items\radio_ids.hpp"

class CfgWeapons
{
	class ItemRadio;
	class MEU_PRC153: ItemRadio {
		scope = 2;
		displayName = "PRC-153";
		descriptionShort = "Motorola XTS2500 Mod. 3 Radio (PRC-153)";
		picture = PATHTOF(data\ui\icon_prc153_ca.paa);		
		author = "Kavinsky";
		icon="iconBackpack";

		tf_encryptionCode = "meu_prc153_encryption";
		tf_dialog = GVAR(Radio_Dialog);
		tf_subtype = "digital";
		tf_dialogUpdate = QUOTE(call MEU_PRC153_fnc_dialogUpdate;);
		tf_prototype = 1;
		tf_range = 3000;
		tf_parent = "MEU_PRC153";
	};

	TF_RADIO_IDS(MEU_PRC153,PRC-153)
};