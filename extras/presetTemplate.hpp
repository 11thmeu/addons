class MEU_Preset_CatName {
    displayName = "blabla";
    picture = ""; // optional

    // list of presets
    class Kits {
        class presetNameInternal {
            displayName = "";
            scope = 2;

            conditions[] = {"isGroupLeader"};
            radioPreset = "";

            // personalization for multiple selects.
            uniform[] = {};
            vest[] = {};
            backpack[] = {}; // empty for nothing
            headgear[] = {};
            glasses[] = {};

            // content of containers
            class UniformContainer[] = {

            };

            class VestContainer[] = {

            };

            class BackpackContainer[] = {

            };

            class linkedItems[] = {};

            primaryWeapon[] = {};
            secondaryWeapon[] = {};
            sideWeapon[] = {};

        };
    };
};