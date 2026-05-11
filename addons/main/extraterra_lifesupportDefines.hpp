
/*---------------------------------- Life support macros ----------------------------------*/

//  ------------------------------------ Get var ------------------------------------
//  --- Air ---
#define GET_ATMO(unit) unit getVariable [QEGVAR(lifesupport,unitInAtmo),nil]
#define GET_AIR_RESERVE(unit) unit getVariable [QEGVAR(lifesupport,unitAirReserve),nil]
#define GET_AIR_RESERVE_MAX(unit) unit getVariable [QEGVAR(lifesupport,unitAirMaxReserve),nil]
#define GET_AIR_CONSUMPTION(unit) unit getVariable [QEGVAR(lifesupport,unitAirConsumption),nil]

//  --- Radiation ---
#define GET_RAD_SHIELD_CASE(unit) unit getVariable [QEGVAR(lifesupport,unitRadShieldCase),nil]
#define GET_RAD_SHIELD_COEFF(unit) unit getVariable [QEGVAR(lifesupport,unitRadShieldCoeff),nil]
#define GET_LIFETIME_RAD(unit) unit getVariable [QEGVAR(lifesupport,unitLifetimeRadLevel),nil]

//  --- Suit ---
#define GET_SUIT_ACTIVATED(unit) unit getVariable [QEGVAR(lifesupport,suitActivated),nil]
#define GET_SUIT_FACTION(unit) unit getVariable [QEGVAR(lifesupport,unitSuitFaction),nil]
#define GET_SUIT_BOOLS(unit) unit getVariable [QEGVAR(lifesupport,unitSuitBools),nil]
#define GET_SUIT_DATA(unit) unit getVariable [QEGVAR(lifesupport,unitSuitData),nil]

//  --- Electrical ---
#define GET_POWER_DRAW(unit) unit getVariable [QEGVAR(lifesupport,unitPowerDraw),nil]
#define GET_BATTERY_RESERVE(unit) unit getVariable [QEGVAR(lifesupport,unitBatteryReserve),nil]
#define GET_BATTERY_RESERVE_MAX(unit) unit getVariable [QEGVAR(lifesupport,unitBatteryMaxReserve),nil]

//  --- Thermal ---
#define GET_CORE_TEMP(unit) unit getVariable [QEGVAR(lifesupport,unitCoreTemp),nil]
#define GET_CORE_TEMP_TARGET(unit) unit getVariable [QEGVAR(lifesupport,unitCoreTempTarget),nil]
#define GET_SUIT_TEMP(unit) unit getVariable [QEGVAR(lifesupport,unitSuitTemp),nil]
#define GET_ENVIRONMENT_TEMP(unit) unit getVariable [QEGVAR(lifesupport,unitEnvTemp),nil]
#define GET_RADIATED_CORE_HEAT(unit) unit getVariable [QEGVAR(lifesupport,unitRadiatedCoreTemp),nil]
#define GET_NET_HEAT(unit) unit getVariable [QEGVAR(lifesupport,unitNetHeatPwr),nil]
#define GET_DELTA_TEMP(unit) unit getVariable [QEGVAR(lifesupport,unitDeltaTemp),nil]
#define GET_ACTIVE_COOL(unit) unit getVariable [QEGVAR(lifesupport,unitActiveThermalCool),nil]
#define GET_ACTIVE_HEAT(unit) unit getVariable [QEGVAR(lifesupport,unitActiveThermalHeat),nil]

//  ------------------------------------ Set var ------------------------------------
//  --- Air ---
#define SET_ATMO(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitInAtmo),value,sync]
#define SET_AIR_RESERVE(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitAirReserve),value,sync]
#define SET_AIR_RESERVE_MAX(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitAirMaxReserve),value,sync]
#define SET_AIR_CONSUMPTION(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitAirConsumption),value,sync]

//  --- Radiation ---
#define SET_RAD_SHIELD_CASE(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitRadShieldCase),value,sync]
#define SET_RAD_SHIELD_COEFF(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitRadShieldCoeff),value,sync]
#define SET_LIFETIME_RAD(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitLifetimeRadLevel),value,sync]

//  --- Suit ---
#define SET_SUIT_ACTIVATED(unit,value,sync) unit setVariable [QEGVAR(lifesupport,suitActivated),value,sync]
#define SET_SUIT_FACTION(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitSuitFaction),value,sync]
#define SET_SUIT_BOOLS(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitSuitBools),value,sync]
#define SET_SUIT_DATA(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitSuitData),value,sync]

//  --- Electrical ---
#define SET_POWER_DRAW(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitPowerDraw),value,sync]
#define SET_BATTERY_RESERVE(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitBatteryReserve),value,sync]
#define SET_BATTERY_RESERVE_MAX(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitBatteryMaxReserve),value,sync]

//  --- Thermal ---
#define SET_CORE_TEMP(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitCoreTemp),value,sync]
#define SET_CORE_TEMP_TARGET(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitCoreTempTarget),value,sync]
#define SET_SUIT_TEMP(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitSuitTemp),value,sync]
#define SET_ENVIRONMENT_TEMP(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitEnvTemp),value,sync]
#define SET_RADIATED_CORE_HEAT(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitRadiatedCoreTemp),value,sync]
#define SET_NET_HEAT(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitNetHeatPwr),value,sync]
#define SET_DELTA_TEMP(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitDeltaTemp),value,sync]
#define SET_ACTIVE_COOL(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitActiveThermalCool),value,sync]
#define SET_ACTIVE_HEAT(unit,value,sync) unit setVariable [QEGVAR(lifesupport,unitActiveThermalHeat),value,sync]

/*---------------------------------- Life support defines ----------------------------------*/

// Air
#define DEFAULT_SUIT_OFF_AIR_RESERVE 1000 // mL
//#define SUIT_AIR_LIFESUPPORT_OFF 100 // Liters

// Thermal
#define THERMAL_CONDUCT_CONSTANT 7.6e-5
#define THERMAL_CONVECTION_COEFF_1ATM 5
#define THERMAL_CONVECTION_COEFF_0P3ATM 1.504

#define HUMAN_SURFACE_AREA 1.9
#define HUMAN_SURFACE_AREA_SUIT 2
#define HUMAN_SPECIFC_HEAT_CAPACITY 2980
#define HUMAN_SKIN_BLACKBODY_EMISSIVE 0.98
#define HUMAN_SKIN_CONVECTION_COEFF 3

#define ROOM_TEMP 294.15 // 21C in Kelvin
    // US
#define DEFAULT_MAX_ACTIVE_COOL_US 1000 // Watts (Thermal)
#define DEFAULT_MAX_ACTIVE_HEAT_US 300 // Watts (Thermal)
    // PRC

// Radiation
#define RAD_SHIELD_ERROR -1
#define RAD_COEFF0_DEFAULT 1 // Multiplier for rad shielding. Rename?
#define RAD_COEFF1_DEFAULT 0.8
#define RAD_COEFF2_DEFAULT 0.4
#define RAD_COEFF3_DEFAULT 0.1
#define RAD_COEFF4_DEFAULT 0.01
#define RAD_COEFF5_DEFAULT 0.001

// Biologic
#define HUMAN_MASS 70 // Kg
#define HUMAN_BASAL_METABOLIC_RATE 101.64 // Watts (Thermal)
#define AREAHUMAN_FRONT 0.5 // m^2
#define AREAHUMAN_SIDE 0.21 // m^2
#define AREAHUMAN_TOP 0.0827 // m^2

// Electrical
    // US
#define SUIT_THEVENIN_VOLTAGE_US 18
#define SUIT_BATTERY_CAP_US (40*3600) // Amp Hrs per second
#define SUIT_BASE_POWER_DRAW_US 52 // Watts (Electrical)
#define SUIT_MIN_PUMP_POWER_US 50 // Watts (Electrical)
#define SUIT_MAX_PUMP_POWER_US 150 // Watts (Electrical)
    // PRC

// Suits
#define DEFAULT_SUIT_MOBILITY 0.5
#define DEFAULT_SUIT_BLACK_BODY 0.8
#define DEFAULT_SUIT_SOLAR_ABSORB 0.5
#define DEFAULT_SUIT_THICKNESS 0.002 // Metres, 2mm
#define DEFAULT_CLOTHES_MOBILITY 0.95
#define DEFAULT_CLOTHES_THICKNESS 0.0006 // Metres, 0.6mm
#define NO_SUIT_FACTION -1
#define US_SUIT_FACTION 0
#define PRC_SUIT_FACTION 1
