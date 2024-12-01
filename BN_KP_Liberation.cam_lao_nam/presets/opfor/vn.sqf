/*
    Needed Mods:
    - S.O.G. Prairie Fire CDLC

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "vn_b_men_army_01";
opfor_squad_leader = "vn_b_men_army_02";
opfor_team_leader = "vn_b_men_sf_01";
opfor_sentry = "vn_b_men_aus_army_66_20";
opfor_rifleman = "vn_b_men_army_15";
opfor_rpg = "vn_b_men_cidg_08";
opfor_grenadier = "vn_b_men_army_07";
opfor_machinegunner = "vn_b_men_army_06";
opfor_heavygunner = "vn_b_men_aus_army_68_06";
opfor_marksman = "vn_b_men_sf_21";
opfor_sharpshooter = "vn_b_men_sf_13";
opfor_sniper = "vn_b_men_sog_21";
opfor_at = "vn_b_men_army_12";
opfor_aa = "vn_b_men_usmc_70_14";
opfor_medic = "vn_b_men_army_03";
opfor_engineer = "vn_b_men_army_04";
opfor_paratrooper = "vn_b_men_army_15";

// Enemy vehicles used by secondary objectives.
opfor_mrap = "vn_b_armor_m577_01_aus_army";
opfor_mrap_armed = "vn_b_armor_m113_acav_01";
opfor_transport_helo = "vn_b_air_ch47_04_02";
opfor_transport_truck = "vn_b_wheeled_m54_01";
opfor_ammobox_transport = "vn_b_wheeled_m54_02_sog";
opfor_fuel_truck = "vn_b_wheeled_m54_fuel";
opfor_ammo_truck = "vn_b_wheeled_m54_ammo";
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";
opfor_flag = "vn_flag_usa";

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "vn_b_men_rok_army_68_15",
    "vn_b_men_rok_army_65_15",
    "vn_b_men_rok_army_68_15",
    "vn_b_men_rok_marine_68_15",
    "vn_b_men_rok_marine_65_15",
    "vn_b_men_rok_army_68_16",
    "vn_b_men_rok_army_65_16",
    "vn_b_men_rok_marine_68_16",
    "vn_b_men_rok_marine_65_16",
    "vn_b_men_rok_army_68_18",
    "vn_b_men_rok_army_65_18",
    "vn_b_men_rok_army_65_18",
    "vn_b_men_rok_marine_68_15",
    "vn_b_men_rok_marine_65_15",
    "vn_b_men_rok_marine_68_18",
    "vn_b_men_rok_marine_65_18",
    "vn_b_men_rok_army_65_15"
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "vn_b_armor_m113_acav_04"
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "vn_b_wheeled_m54_mg_01",
    "vn_b_wheeled_m54_mg_02",
    "vn_b_armor_m113_01_aus_army",
    "vn_b_armor_m113_acav_04",
    "vn_b_armor_m113_acav_02",
    "vn_b_armor_m48_01_01"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "vn_b_wheeled_m54_mg_01",
    "vn_b_armor_m113_acav_04",
    "vn_b_armor_m113_01_aus_army"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "vn_b_wheeled_m54_mg_01",
    "vn_b_wheeled_m54_mg_02",
    "vn_b_wheeled_m54_01_usmc",
    "vn_b_armor_m113_01_aus_army",
    "vn_b_armor_m113_acav_04",
    "vn_b_armor_m113_acav_02",
    "vn_b_armor_m48_01_01"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "vn_b_wheeled_m54_mg_01",
    "vn_b_armor_m113_01_aus_army",
    "vn_b_armor_m113_acav_04"
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "vn_b_wheeled_m54_01_usmc",
    "vn_b_wheeled_m54_01_sog"
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "vn_b_air_uh1c_02_07",
    "vn_b_air_uh1c_05_07",
    "vn_b_air_uh1c_01_07",
    "vn_b_air_uh1c_07_06",
    "vn_b_air_uh1c_04_06",
    "vn_b_air_ach47_04_01",
    "vn_b_air_ach47_05_01",
    "vn_b_air_ach47_01_01",
    "vn_b_air_ach47_02_01",
    "vn_b_air_ah1g_02",
    "vn_b_air_ah1g_03",
    "vn_b_air_ah1g_04",
    "vn_b_air_ah1g_05",
    "vn_b_air_ah1g_01",
    "vn_b_air_ah1g_10",
    "vn_b_air_oh6a_04",
    "vn_b_air_oh6a_03",
    "vn_b_air_uh1c_06_01",
    "vn_b_air_uh1c_01_02",
    "vn_b_air_ch34_04_02",
    "vn_b_air_ch34_04_01",
    "vn_b_air_uh1e_01_04",
    "vn_b_air_uh1c_01_04",
    "vn_b_air_ah1g_10_usmc",
    "vn_b_air_ah1g_05_usmc",
    "vn_b_air_ah1g_02_usmc"
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "vn_b_air_f4b_navy_cas",
    "vn_b_air_f4c_ucas",
    "vn_b_air_f4c_cas",
    "vn_b_air_f100d_hcas",
    "vn_b_air_f100d_cas",
    "vn_b_air_f4b_usmc_cas"
];
