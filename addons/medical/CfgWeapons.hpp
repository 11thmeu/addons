class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;
    class MEU_IFAK: ACE_ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        model = "\A3\Weapons_F\Items\Medikit";
        displayName = "$STR_MEU_Medical_IFAK_name";
        descriptionshort = "$STR_MEU_Medical_IFAK_desc";
        picture = QUOTE(PATHTOF(UI\ifak_x_ca.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 13;
        };
    };
    class MEU_IFAK_Empty: ACE_ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        model = "\A3\Weapons_F\Items\Medikit";
        displayName = "$STR_MEU_Medical_IFAK_empty_name";
        descriptionshort = "$STR_MEU_Medical_IFAK_empty_desc";
        picture = QUOTE(PATHTOF(UI\ifak_empty_x_ca.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };
};