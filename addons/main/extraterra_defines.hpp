
/*---------------------------------- General macros ----------------------------------*/

// General use
#define KELVIN_TO_CELCIUS(input) (input - 273.15)
#define KELVIN_TO_FAHRENHEIT(input) (input - 273.15)*(9/5) + 32
#define CELCIUS_TO_KELVIN(input) (input + 273.15)

// HUD macros
#define NOT_IN_VEHICLE(unit) (isNull objectParent unit)
#define PLAYER_GROUP (group ACE_player)

// Maths
#define BREATHING_PAIN_FUNCTION(coeff,pain) (coeff*(0.00052652*(exp(7.26135*pain))))
#define BREATHING_VO2_FUNCTION(respRate,suitMobility) ((respRate^3 * (linearConversion[0,1,suitMobility,110.756,138.975])) + (respRate^2 * -(linearConversion[0,1,suitMobility,127.42,222.781])) + (respRate * (linearConversion[0,1,suitMobility,61.1643,128.306])) + 3.5)
#define THERMAL_GENERALIZED_CONVECTION_COEFF_FUNCTION(pressure) (0 max ((1.13285*((pressure/PRESSURE_PA_1ATM)^3)) - (0.798924*((pressure/PRESSURE_PA_1ATM)^2)) + (4.67225*(pressure/PRESSURE_PA_1ATM)) - 0.0064124)) // Not used, just in case I add variable pressure

/*---------------------------------- General defines ----------------------------------*/

// Environment
#define NORMAL_BACKGROUND_RADIATION 0.057 // Millisieverts
#define SOLAR_RADIATION_WATTAGE_1AU 1361 // Watt per m^2
#define STEFAN_BOLTZMANN_CONSTANT 5.670367e-8

// Pressure
#define PRESSURE_PA_1ATM 101325
#define PRESSURE_PA_0P3ATM 33775
#define ATMO_STATE_ERROR -1
#define ATMO_STATE_VACUUM 0
#define ATMO_STATE_1ATM 1
#define ATMO_STATE_0P3ATM 2

// Local temp simulation constants
#define IS_IN_SUN_CHECK_VECTOR_LENGTH 5000
#define LOCAL_TEMP_VECTOR_HEIGHT_AGL 0.5
#define ROOM_TEMP 294.15 // 21C in Kelvin
#define DEFAULT_MIN_ENVIRON_TEMP 133.15
#define DEFAULT_MAX_ENVIRON_TEMP 393.15

#define PREBREATHE_SAFE_THRESHOLD 0.5
#define TIME_TO_FULL_PREBREATHE 600

#define INTERVAL 0.20 // Used in lowBlowFlowPP, injuries PBO. Rename

#define HUMAN_NATURAL_CORETEMP 310.15
#define CORE_TEMP_ERROR 0.001

// HUDs
#define DEFAULT_IFF_RANGE 5000 // Metres
#define HUMAN_DANGEROUS_TEMPS [288.15,312.15] // For HUD danger display. Rename
#define IFF_NEARBYUNITS_OFFSET [0,0,0] // Currently not used, from updateIFF
#define KNOWS_ABOUT_IFF_THRESHOLD 0.75

#define DEFAULT_MIN_IFF_MAN_FOV 0.25
#define DEFAULT_MIN_IFF_OTHER_FOV 0.5
#define DEFAULT_IFF_FADE_DIST_END 5
#define DEFAULT_IFF_FADE_DIST_START 25

/*---------------------------------- Includes ----------------------------------*/

#include "extraterra_lifesupportDefines.hpp"
#include "extraterra_injuryDefines.hpp"
#include "extraterra_factionalDefines.hpp"
