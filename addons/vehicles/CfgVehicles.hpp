class CfgVehicles {    
    class All;
    class AllVehicles: All { MEU_SideJump = 0; };
    
    class Car;
    class Car_F: Car { MEU_SideJump = 1; };
    class Truck_F: Car_F { MEU_SideJump = 0; };
    
    class LandVehicle;
    class Motorcycle: LandVehicle { MEU_SideJump = 0; };
    class Tank: LandVehicle { MEU_SideJump = 0; };
    class StaticWeapon: LandVehicle { MEU_SideJump = 0; };

    class Heli_Light_01_unarmed_base_F;
    class B_Heli_Light_01_F: Heli_Light_01_unarmed_base_F { MEU_SideJump = 1; };
    
    class Heli_Light_01_armed_base_F;
    class B_Heli_Light_01_armed_F: Heli_Light_01_armed_base_F { MEU_SideJump = 1; };
    
    class Heli_Light_02_base_F;
    class O_Heli_Light_02_F: Heli_Light_02_base_F { MEU_SideJump = 1; };
    class Heli_Light_02_unarmed_base_F;
    class O_Heli_Light_02_unarmed_F: Heli_Light_02_unarmed_base_F { MEU_SideJump = 1; };
    
    class Heli_Transport_01_base_F;
    class B_Heli_Transport_01_F: Heli_Transport_01_base_F { MEU_SideJump = 1; };
    
    class Heli_Transport_02_base_F;
    class I_Heli_Transport_02_F: Heli_Transport_02_base_F { MEU_SideJump = 1; };
    
    class Heli_Attack_02_base_F;
    class O_Heli_Attack_02_F: Heli_Attack_02_base_F { MEU_SideJump = 1; };
    class O_Heli_Attack_02_black_F: Heli_Attack_02_base_F { MEU_SideJump = 1; };
    
    class Heli_light_03_base_F;
    class I_Heli_light_03_F: Heli_light_03_base_F { MEU_SideJump = 1; };
    
    class Heli_light_03_unarmed_base_F;
    class I_Heli_light_03_unarmed_F: Heli_light_03_unarmed_base_F { MEU_SideJump = 1; };
};