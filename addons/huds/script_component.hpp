#define COMPONENT huds
#define COMPONENT_BEAUTIFIED Huds
#include "\z\exterra\addons\main\script_mod.hpp"

 #define DEBUG_MODE_FULL
 #define DISABLE_COMPILE_CACHE
 #define ENABLE_PERFORMANCE_COUNTERS

#include "\z\exterra\addons\main\script_macros.hpp"

// Note: I've decided to keep the control group positions in the hudPositions function rather than putting them here.
#define BOOTUP_LOGO_US_POS [0.2523 * safeZoneW + safeZoneX,0.148 * safeZoneH + safeZoneY,0.16875 * safeZoneW,0.15 * safeZoneH]
#define BOOTUP_BISTGRID_US_POS [0.148438 * safeZoneW + safeZoneX,0 * safeZoneH + safeZoneY,0.703125 * safeZoneW,1.25 * safeZoneH]
#define BOOTUP_TEXT_US_POS [0.2523 * safeZoneW + safeZoneX,0.302 * safeZoneH + safeZoneY,0.5 * safeZoneW,0.55 * safeZoneH]
#define BOOTUP_HEADLINE_TEXT_US_POS [0.329844 * safeZoneW + safeZoneX,0.4093 * safeZoneH + safeZoneY,0.335156 * safeZoneW,0.11 * safeZoneH]

#define INFO_BACKGROUND_US_POS [0.0555 * safeZoneW,0.02 * safeZoneH,0.3375 * safeZoneW,0.15 * safeZoneH]
#define INFO_AIRREMAIN_TEXT_US_POS [0.1435 * safeZoneW,0.054 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define INFO_BATTREMAIN_TEXT_US_POS [0.147 * safeZoneW,0.118 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define INFO_INTERNALTEMP_TEXT_US_POS [0.102 * safeZoneW,0.0845 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define INFO_EXTERNALTEMP_TEXT_US_POS [0.238 * safeZoneW,0.0845 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define INFO_THERMALPOWERBALANCE_TEXT_US_POS [0.134 * safeZoneW,0.0845 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define INFO_TIMEUNTILDANG_TEXT_US_POS [0.205 * safeZoneW,0.0845 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define INFO_EXTERNALATMO_TEXT_US_POS [0.173 * safeZoneW,0.0525 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define INFO_RADPERHOUR_TEXT_US_POS [0.2335 * safeZoneW,0.1155 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define INFO_LIFETIMERAD_TEXT_US_POS [0.1933 * safeZoneW,0.1155 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]

#define WEAPON_BACKGROUND_US_POS [0.08 * safeZoneW,-0.0425 * safeZoneH,0.16875 * safeZoneW,0.3 * safeZoneH]
#define WEAPON_CURRENTWEAPON_US_POS [0.117 * safeZoneW,0.0225 * safeZoneH,0.095625 * safeZoneW,0.17 * safeZoneH]
#define WEAPON_SECONDWEAPON_US_POS [0.1833 * safeZoneW,0.14 * safeZoneH,0.05625 * safeZoneW,0.1 * safeZoneH]
#define WEAPON_LAUNCHER_US_POS [0.2 * safeZoneW,0.042 * safeZoneH,0.05625 * safeZoneW,0.1 * safeZoneH]
#define WEAPON_GRENADE_US_POS [0.1425 * safeZoneW,0.1725 * safeZoneH,0.0185625 * safeZoneW,0.033 * safeZoneH]
#define WEAPON_GRENADE_TEXT_US_POS [0.1225 * safeZoneW,0.1475 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define WEAPON_GRENADEAMOUNT_TEXT_US_POS [0.118 * safeZoneW,0.169 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define WEAPON_WEAPONMAGAZINES_TEXT_US_POS [0.13425 * safeZoneW,0.045 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define WEAPON_FIREMODE_TEXT_US_POS [0.11 * safeZoneW,0.045 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define WEAPON_WEAPONZERO_TEXT_US_POS [0.11 * safeZoneW,0.1225 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]

#define RANGEFINDER_BACKGROUND_US_POS [0,0,0.140625 * safeZoneW,0.125 * safeZoneH]
#define RANGEFINDER_GRID_US_POS [0.053 * safeZoneW,0.05125 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define RANGEFINDER_BEARING_US_POS [0.026 * safeZoneW,0.05125 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define RANGEFINDER_RANGE_US_POS [0.0875 * safeZoneW,0.05125 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]

#define SQUAD_MEMBER0_TEXT_US_POS [0.0175 * safeZoneW,0.053 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER1_TEXT_US_POS [0.0175 * safeZoneW,0.073 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER2_TEXT_US_POS [0.0175 * safeZoneW,0.093 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER3_TEXT_US_POS [0.0175 * safeZoneW,0.113 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER4_TEXT_US_POS [0.0175 * safeZoneW,0.133 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER5_TEXT_US_POS [0.0175 * safeZoneW,0.153 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER6_TEXT_US_POS [0.0175 * safeZoneW,0.173 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER7_TEXT_US_POS [0.0175 * safeZoneW,0.193 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER8_TEXT_US_POS [0.0175 * safeZoneW,0.213 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER9_TEXT_US_POS [0.0875 * safeZoneW,0.053 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER10_TEXT_US_POS [0.0875 * safeZoneW,0.073 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER11_TEXT_US_POS [0.0875 * safeZoneW,0.093 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER12_TEXT_US_POS [0.0875 * safeZoneW,0.113 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER13_TEXT_US_POS [0.0875 * safeZoneW,0.133 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER14_TEXT_US_POS [0.0875 * safeZoneW,0.153 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER15_TEXT_US_POS [0.0875 * safeZoneW,0.173 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER16_TEXT_US_POS [0.0875 * safeZoneW,0.193 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER17_TEXT_US_POS [0.0875 * safeZoneW,0.213 * safeZoneH,0.1125 * safeZoneW,0.1 * safeZoneH]
#define SQUAD_MEMBER0_HEART_US_POS [0.01 * safeZoneW,0.055 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER1_HEART_US_POS [0.01 * safeZoneW,0.075 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER2_HEART_US_POS [0.01 * safeZoneW,0.095 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER3_HEART_US_POS [0.01 * safeZoneW,0.115 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER4_HEART_US_POS [0.01 * safeZoneW,0.135 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER5_HEART_US_POS [0.01 * safeZoneW,0.155 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER6_HEART_US_POS [0.01 * safeZoneW,0.175 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER7_HEART_US_POS [0.01 * safeZoneW,0.195 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER8_HEART_US_POS [0.01 * safeZoneW,0.215 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER9_HEART_US_POS [0.08 * safeZoneW,0.055 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER10_HEART_US_POS [0.08 * safeZoneW,0.075 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER11_HEART_US_POS [0.08 * safeZoneW,0.095 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER12_HEART_US_POS [0.08 * safeZoneW,0.115 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER13_HEART_US_POS [0.08 * safeZoneW,0.135 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER14_HEART_US_POS [0.08 * safeZoneW,0.155 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER15_HEART_US_POS [0.08 * safeZoneW,0.175 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER16_HEART_US_POS [0.08 * safeZoneW,0.195 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]
#define SQUAD_MEMBER17_HEART_US_POS [0.08 * safeZoneW,0.215 * safeZoneH,0.0084375 * safeZoneW,0.015 * safeZoneH]


/*#define SOLAR_RADIATION_WATTAGE_1AU 1361// watts per m^2
#define AREAHUMAN_FRONT 0.5// m^2
#define AREAHUMAN_SIDE 0.21// m^2
#define AREAHUMAN_TOP 0.0827// m^2
#define HUMAN_SURFACE_AREA 1.9
#define HUMAN_SURFACE_AREA_SUIT 2
#define HUMAN_SPECIFC_HEAT_CAPACITY 2980
#define HUMAN_SKIN_BLACKBODY_EMISSIVE 0.98
#define HUMAN_SKIN_CONVECTION_COEFF 3
#define HUMAN_NATURAL_CORETEMP 310.15
#define HUMAN_MASS 70

#define RAD_COEFF0_DEFAULT 1
#define RAD_COEFF1_DEFAULT 0.8
#define RAD_COEFF2_DEFAULT 0.4
#define RAD_COEFF3_DEFAULT 0.1
#define RAD_COEFF4_DEFAULT 0.01
#define RAD_COEFF5_DEFAULT 0.001

#define STEFAN_BOLTZMANN_CONSTANT 5.670367e-8
#define EARTH_ATMO_PRESSURE_PA 101325
#define THERMAL_CONDUCT_CONSTANT 7.6e-5
#define THERMAL_CONVECTION_COEFF_1ATM 5

#define NORMAL_TEMP 294.15// 21C in Kelvin
#define SUIT_THICKNESS 0.005// in metres, 5mm*/
