/*
    Needed Mods:
    - S.O.G. Prairie Fire CDLC

    Optional Mods:
    - None
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_vn_hut_mont_01";                             // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container. (Land_vn_cargo20_military_green_f could be usable when it is slingloadable.
FOB_truck_typename = "vn_o_wheeled_z157_02";                             // This is the FOB as a vehicle.
Arsenal_typename = "Land_vn_us_weapons_stack2";                         // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "vn_o_wheeled_z157_repair_nva65";                 // This is the mobile respawn (and medical) truck. (Not medical or optimal but at least less emersion breaking that HEMTT)
huron_typename = "vn_o_air_mi2_02_02";                                 // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "vn_o_men_nva_38";                                 // This defines the crew for vehicles.
pilot_classname = "vn_o_men_aircrew_01";                                // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "vn_b_air_oh6a_01";               // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "vn_c_boat_02_02";                       // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "vn_o_wheeled_z157_01";                  // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";     // A small storage area for resources. (Land_vn_hootch_01_wall)
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";     // A large storage area for resources. (Land_vn_barracks_04_wall)
KP_liberation_recycle_building = "Land_vn_wf_vehicle_service_point_east";                // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "Land_vn_mobileradar_01_radar_f";           // The building defined to unlock FOB air vehicle functionality.
KP_liberation_heli_slot_building = "Land_vn_b_helipad_01";              // The helipad used to increase the GLOBAL rotary-wing cap.
KP_liberation_plane_slot_building = "Land_vn_usaf_hangar_02";           // The hangar used to increase the GLOBAL fixed-wing cap.
KP_liberation_supply_crate = "Land_FoodSacks_01_cargo_brown_F";         // This defines the supply crates, as in resources.
KP_liberation_ammo_crate = "vn_b_ammobox_supply_05";                    // This defines the ammunition crates.
KP_liberation_fuel_crate = "CargoNet_01_barrels_F";                     // This defines the fuel crates.

/*
    --- Friendly classnames ---
    Each array below represents one of the 7 pages within the build menu.
    Format: ["vehicle_classname",supplies,ammunition,fuel],
    Example: ["B_APC_Tracked_01_AA_F",300,150,150],
    The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.
    IMPORTANT: The last element inside each array must have no comma at the end!
*/
infantry_units = [
    ["vn_o_men_nva_dc_12",15,0,0],                                        // Rifleman (Light)
    ["vn_o_men_nva_dc_06",20,0,0],                                        // Rifleman
    ["vn_o_men_nva_dc_14",30,0,0],                                        // Rifleman (AT)
    ["vn_o_men_nva_dc_07",25,0,0],                                        // Grenadier
    ["vn_o_men_nva_dc_11",25,0,0],                                        // Autorifleman
    ["vn_o_men_nva_dc_10",30,0,0],                                        // Marksman
    ["vn_o_men_nva_dc_18",40,0,0],                                        // Sharpshooter
    ["vn_o_men_vc_regional_14",50,10,0],                                       // AT Specialist
    ["vn_o_men_vc_regional_08",30,0,0],                                        // Combat Life Saver
    ["vn_o_men_nva_dc_01",30,0,0],                                        // Engineer
    ["vn_o_men_nva_dc_09",30,0,0],                                        // Explosives Specialist
    ["vn_o_men_vc_05",20,0,0],                                          // Recon Scout
    ["vn_o_men_vc_10",30,0,0],                                          // Recon Marksman
    ["vn_o_men_vc_08",30,0,0],                                          // Recon Paramedic
    ["vn_o_men_vc_09",30,0,0],                                          // Recon Demolition Expert
    ["vn_o_men_nva_44",50,0,0],                                          // Strela
    ["vn_o_men_kr_70_19",10,0,0],                                        // Crewman
    ["vn_o_men_nva_65_18",20,0,0],                                        // Para Trooper
    ["vn_o_men_aircrew_02",10,0,0],                                     // Helicopter Crew
    ["vn_o_men_aircrew_01",10,0,0],                                     // Helicopter Pilot
    ["vn_o_men_aircrew_08",10,0,0]                                     // Pilot
];

light_vehicles = [
    ["vn_c_bicycle_01",10,0,0],                                         // Bicycle
    ["vn_o_car_01_01_kr",75,0,50],                                   // Car (Boheme Bonn)   
    ["vn_o_car_02_01",75,40,50],                               // Car (Boheme Rodina)       
    ["vn_o_car_04_01_kr",75,50,50],                               // Van (Boheme Krabice)
    ["vn_o_car_04_mg_01",95,30,60],                               // Van (Boheme Krabice/ DP-27)
    ["vn_o_wheeled_z157_mg_01_pl",100,60,50],                               // M54 Gun Truck (3x M2HB)
    ["vn_o_wheeled_btr40_01_vcmf",75,0,50],                                   // M151A1 Transport (Covered)
    ["vn_b_wheeled_m54_mg_03",100,80,50],                               // M54 Gun Truck (Minigun)
    ["vn_o_wheeled_z157_mg_02_nva65",100,120,50],                              // M54 (M45 Quad)
    ["vn_o_wheeled_z157_01",125,0,75],                                   // M54 Transport
    ["vn_o_wheeled_z157_02_kr",125,0,75],                                   // M54 Transport (Covered)
    ["vn_c_boat_01_00",25,0,25],                                        // Boat
    ["vn_c_boat_02_00",35,0,25],                                        // Long Boat
    ["vn_o_boat_03_01",200,120,75]                                      // PTF Nasty (Mortar)
];

heavy_vehicles = [
    ["vn_o_armor_t54b_01_vcmf",300,100,150]                                // M41A3 Walker Bulldog
];

air_vehicles = [
    ["vn_o_air_mi2_02_01",200,10,100],                                    // OH-6A Cayuse
    ["vn_o_air_mi2_04_05",200,200,100],                                   // OH-6A Cayuse (Gunship/APERS)
    ["vn_b_air_oh6a_04",200,200,100],                                   // OH-6A Cayuse (Gunship/CAS)
    ["vn_o_air_mi2_01_01",225,20,125],                                 // UH-34D Seahorse (M60 x2)
    ["vn_o_air_mi2_04_05",225,300,100],                                // UH-34 Stinger (APERS)
    ["vn_o_air_mi2_04_03",225,300,100],                                // UH-34 Stinger (CAS)
    ["vn_o_air_mi2_03_05",225,300,100],                                // UH-34 Stinger (FAC)
    ["vn_o_air_mi2_04_02",225,300,100],                                // UH-34 Stinger (FFAR)
    ["vn_o_air_mi2_01_01",200,60,150],                                 // UH-1C Iroquois Slick (Army)
    ["vn_o_air_mi2_04_04",500,400,200],                                // UH-1C Iroquois Hog (Army)
    ["vn_b_air_ah1g_02",500,400,200],                                   // AH-1G Cobra (APERS)
    ["vn_b_air_ah1g_03",500,400,200],                                   // AH-1G Cobra (AT)
    ["vn_b_air_ah1g_04",500,400,200],                                   // AH-1G Cobra (CAS)
    ["vn_b_air_ah1gd_05",500,400,200],                                  // AH-1G Cobra (FAC)
    ["vn_b_air_ah1g_01",500,400,200],                                   // AH-1G Cobra (FFAR)
    ["vn_o_air_mi2_02_01",250,0,150],                                  // UH-1D Iroquois (Dust Off) MedEvac
    ["vn_o_air_mig19_at",1250,1250,450],                                  // F-4C Phantom II (AT)
    ["vn_o_air_mig19_cas",1250,1250,450],                                 // F-4C Phantom II (CAS)
    ["vn_o_air_mig19_cap",1250,1250,450]                                  // F-4C Phantom II (CAP)
];

static_vehicles = [
    ["vn_o_pl_static_mg42_high",20,30,0],                              // M60 (High)
    ["vn_o_pl_static_mg42_low",20,30,0],                               // M60 (Low)
    ["vn_o_pl_static_mg42_high",25,40,0],                          // M-1919A4 .30cal (High)
    ["vn_o_kr_static_m1910_low_01",25,40,0],                           // M-1919A4 .30cal (Low)
    ["vn_o_vc_static_mg42_low",35,40,0],                               // M-1919A6 .30cal
    ["vn_o_nva_static_dshkm_high_01",35,60,0],                               // M-2HB .50cal (High)
    ["vn_o_nva_static_dshkm_low_02",35,60,0],                                // M-2HB .50cal (Low)
    ["vn_o_vc_static_mortar_type63",40,80,0],                             // M2 60mm Mortar
    ["vn_o_vc_static_mortar_type53",50,100,0],                           // M29 81mm Mortar
    ["vn_o_nva_65_static_zpu4",50,100,0],                                  // M-45 Quadmount
    ["vn_o_nva_navy_static_d44",80,100,0],                                 // M101 105mm Howitzer
    ["vn_o_nva_static_type56rr",80,100,0]                                        // BGM71 TOW
];

buildings = [
    ["Land_vn_o_tower_01",0,0,0],
    ["Land_vn_o_tower_02",0,0,0],
    ["Land_vn_o_tower_03",0,0,0],
    ["Land_vn_o_bunker_01",0,0,0],
    ["Land_vn_o_bunker_02",0,0,0],
    ["Land_vn_o_bunker_03",0,0,0],
    ["Land_vn_o_bunker_04",0,0,0],
    ["Land_vn_o_platform_01",0,0,0],
    ["Land_vn_o_platform_02",0,0,0],
    ["Land_vn_o_platform_03",0,0,0],
    ["Land_vn_o_platform_04",0,0,0],
    ["Land_vn_o_platform_05",0,0,0],
    ["Land_vn_o_platform_06",0,0,0],
    ["Land_vn_o_shelter_01",0,0,0],
    ["Land_vn_o_shelter_02",0,0,0],
    ["Land_vn_o_shelter_03",0,0,0],
    ["Land_vn_o_shelter_04",0,0,0],
    ["Land_vn_o_shelter_05",0,0,0],
    ["Land_vn_camonetb_east",0,0,0],
    ["Land_vn_camonet_east",0,0,0],
    ["Land_vn_o_wallfoliage_01",0,0,0],
    ["Land_vn_o_snipertree_01",0,0,0],
    ["Land_vn_o_snipertree_02",0,0,0],
    ["Land_vn_o_snipertree_03",0,0,0],
    ["Land_vn_o_snipertree_04",0,0,0],
    ["vn_sign_town_d_11_01",0,0,0],
    ["Land_vn_hut_river_03",0,0,0],
    ["Land_vn_o_trench_firing_01",0,0,0],
    ["Land_vn_o_prop_cong_cage_01",0,0,0],
    ["Land_vn_o_prop_cong_cage_03",0,0,0],
    ["Land_vn_fence_punji_01_03",0,0,0],
    ["Land_vn_fence_punji_01_05",0,0,0],
    ["Land_vn_fence_punji_01_10",0,0,0],
    ["vn_flag_pavn",0,0,0],
    ["Land_vn_d_fallentrunk_branches_f",0,0,0],
    ["Land_vn_d_fallentrunk_clear_f",0,0,0],
    ["Land_vn_toilet_b",0,0,0],                     
    ["Flag_RedCrystal_F",0,0,0],
    ["Flag_White_F",0,0,0],
    ["Land_vn_mobileradar_01_generator_f",0,0,0],
    ["Land_vn_mobileradar_01_radar_f",0,0,0],
    ["vn_b_prop_fmradio_01",0,0,0],
    ["vn_bar_01_campchair_01",0,0,0],
    ["vn_steeldrum_bbq_02",0,0,0],
    ["vn_steeldrum_half_02",0,0,0],
    ["vn_steeldrum_trash_02",0,0,0]
];

support_vehicles = [
    [Arsenal_typename,100,200,0],
    [Respawn_truck_typename,200,0,100],
    [FOB_box_typename,300,500,0],
    [FOB_truck_typename,300,500,75],
    [KP_liberation_small_storage_building,0,0,0],
    [KP_liberation_large_storage_building,0,0,0],
    [KP_liberation_recycle_building,250,0,0],
    [KP_liberation_air_vehicle_building,1000,0,0],
    [KP_liberation_heli_slot_building,250,0,0],
    [KP_liberation_plane_slot_building,500,0,0],
    ["vn_b_wheeled_m54_repair",325,0,75],                               // M185 Repair
    ["vn_b_wheeled_m54_fuel",125,0,275],                                // M49 Fuel
    ["vn_b_wheeled_m54_ammo",125,200,75],                               // M54 Ammo
    ["B_Slingload_01_Repair_F",275,0,0],                                // Huron Repair
    ["B_Slingload_01_Fuel_F",75,0,200],                                 // Huron Fuel
    ["B_Slingload_01_Ammo_F",75,200,0]                                  // Huron Ammo
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
    "vn_o_men_nva_65_15",
    "vn_o_men_nva_dc_06", // Rifleman
    "vn_o_men_nva_dc_06", // Rifleman
    "vn_o_men_nva_dc_14", // Rifleman (AT)
    "vn_o_men_nva_dc_07", // Grenadier
    "vn_o_men_nva_dc_11", // Autorifleman
    "vn_o_men_nva_dc_11", // Autorifleman
    "vn_o_men_nva_dc_10", // Marksman
    "vn_o_men_vc_regional_08", // Combat Life Saver
    "vn_o_men_nva_dc_01" // Engineer
];

// Heavy infantry squad.
blufor_squad_inf = [
    "vn_o_men_nva_65_15",
    "vn_o_men_nva_dc_14", // Rifleman (AT)
    "vn_o_men_nva_dc_14", // Rifleman (AT)
    "vn_o_men_nva_dc_07", // Grenadier
    "vn_o_men_nva_dc_11", // Autorifleman
    "vn_o_men_nva_dc_11", // Autorifleman
    "vn_o_men_nva_dc_11", // Autorifleman
    "vn_o_men_nva_dc_18", // Sharpshooter
    "vn_o_men_vc_regional_08", // Combat Life Saver
    "vn_o_men_nva_dc_01"  // Engineer
];

// AT specialists squad.
blufor_squad_at = [
    "vn_o_men_nva_65_15",
    "vn_o_men_nva_dc_06", // Rifleman
    "vn_o_men_nva_dc_06", // Rifleman
    "vn_o_men_nva_dc_14", // Rifleman (AT)
    "vn_o_men_nva_dc_14", // Rifleman (AT)
    "vn_o_men_nva_dc_14", // Rifleman (AT)
    "vn_o_men_vc_regional_08",
    "vn_o_men_nva_dc_06" // Rifleman
];

// AA specialists squad. Never gonna be available in VN <--- stimme ich zu, könnte also ganz weg (weiß nicht, wie das dann gelöst wird)
blufor_squad_aa = [
    "vn_o_men_nva_65_15",
    "vn_o_men_nva_dc_06", // Rifleman
    "vn_o_men_nva_dc_06", // Rifleman
    "vn_o_men_nva_44", // AA Specialist (Won't be any for VN)
    "vn_o_men_nva_44", // AA Specialist (Won't be any for VN)
    "vn_o_men_nva_44", // AA Specialist (Won't be any for VN)
    "vn_o_men_vc_regional_08", // Combat Life Saver
    "vn_o_men_nva_dc_06" // Rifleman
];

// Force recon squad.
blufor_squad_recon = [
    "vn_o_men_nva_15",
    "vn_o_men_vc_05", // Recon Scout
    "vn_o_men_vc_05", // Recon Scout
    "vn_o_men_vc_14", // Recon Scout (AT)
    "vn_o_men_vc_10", // Recon Marksman
    "vn_o_men_vc_10", // Recon Marksman
    "vn_o_men_vc_13",
    "vn_o_men_vc_13",
    "vn_o_men_vc_08", // Recon Paramedic
    "vn_o_men_vc_09" // Recon Demolition Expert
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "vn_o_men_nva_65_18", // Para Trooper
    "vn_o_men_nva_65_18", // Para Trooper
    "vn_o_men_nva_65_18", // Para Trooper
    "vn_o_men_nva_65_18", // Para Trooper
    "vn_o_men_nva_65_18", // Para Trooper
    "vn_o_men_nva_65_18", // Para Trooper
    "vn_o_men_nva_65_18", // Para Trooper
    "vn_o_men_nva_65_18", // Para Trooper
    "vn_o_men_nva_65_18", // Para Trooper
    "vn_o_men_nva_65_18" // Para Trooper
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    
    "vn_b_air_ah1g_02",                                   // AH-1G Cobra (APERS)
    "vn_b_air_ah1g_03",                                   // AH-1G Cobra (AT)
    "vn_b_air_ah1g_04",                                   // AH-1G Cobra (CAS)
    "vn_b_air_ah1gd_05",                                  // AH-1G Cobra (FAC)
    "vn_b_air_ah1g_01"                                   // AH-1G Cobra (FFAR)
];
