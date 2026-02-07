
/*
---------------------------------- Macros ----------------------------------
*/

#define KELVIN_TO_CELCIUS(input) (input - 273.15)
#define CELCIUS_TO_KELVIN(input) (input + 273.15)
#define SYS_STR(input) (systemChat str input) // I like to use systemChat *a lot* for live debugging. Hopefully that's not terrible practice

/*
---------------------------------- Defines ----------------------------------
*/

// Environment
#define NORMAL_BACKGROUND_RADIATION 0.057 // Millisieverts
#define SOLAR_RADIATION_WATTAGE_1AU 1361 // Watt per m^2
#define STEFAN_BOLTZMANN_CONSTANT 5.670367e-8
//#define STEFAN_BOLTZMANN_SIGMA (STEFAN_BOLTZMANN_CONSTANT*SUIT_EMMISSIVE_US*HUMAN_SURFACE_AREA_SUIT) | Consider making this a function that pulls an emissive value from the uniform config
#define RAD_COEFF0_DEFAULT 1 // Multiplier for rad shielding. Rename?
#define RAD_COEFF1_DEFAULT 0.8
#define RAD_COEFF2_DEFAULT 0.4
#define RAD_COEFF3_DEFAULT 0.1
#define RAD_COEFF4_DEFAULT 0.01
#define RAD_COEFF5_DEFAULT 0.001

// Pressure
#define EARTH_ATMO_PRESSURE_PA 101325

// Thermal
#define THERMAL_CONDUCT_CONSTANT 7.6e-5
#define THERMAL_CONVECTION_COEFF_1ATM 5

#define IS_IN_SUN_CHECK_VECTOR_LENGTH 200

#define HUMAN_SURFACE_AREA 1.9
#define HUMAN_SURFACE_AREA_SUIT 2
#define HUMAN_SPECIFC_HEAT_CAPACITY 2980
#define HUMAN_SKIN_BLACKBODY_EMISSIVE 0.98
#define HUMAN_SKIN_CONVECTION_COEFF 3
    // US
#define SUIT_THICKNESS 0.005 // Metres, 5mm. Rename
#define DEFAULT_MAX_ACTIVE_COOL_US 1000 // Watts (Thermal)
#define DEFAULT_MAX_ACTIVE_HEAT_US 300 // Watts (Thermal)
    // PRC

// Biologic
#define HUMAN_MASS 70 // Kg
#define HUMAN_BASAL_METABOLIC_RATE 101.64 // Watts (Thermal)
#define AREAHUMAN_FRONT 0.5 // m^2
#define AREAHUMAN_SIDE 0.21 // m^2
#define AREAHUMAN_TOP 0.0827 // m^2

#define SUIT_AIR_LIFESUPPORT_OFF 100 // Liters
#define PREBREATHE_SAFE_THRESHOLD 0.5
#define TIME_TO_FULL_PREBREATHE 600

#define INTERVAL 0.20 // Used in lowBlowFlowPP, injuries PBO. Rename

#define HUMAN_NATURAL_CORETEMP 310.15

#define HYPERTHERMIA_STAGE_MILD 310.4
#define HYPERTHERMIA_STAGE_MODERATE 311.15
#define HYPERTHERMIA_STAGE_SEVERE 313.15
#define HYPERTHERMIA_STAGE_DEATH 313.65
#define HYPERTHERMIA_MAX_HEARTRATE 160
#define HYPERTHERMIA_MIN_RESISTANCE -85
#define HEADACHE_MAX_PAIN 0.5 // Used in hyperthermia function. Rename

#define HYPOTHERMIA_STAGE_MILD 308.15
#define HYPOTHERMIA_STAGE_MODERATE 305.15
#define HYPOTHERMIA_STAGE_SEVERE 301.15
#define HYPOTHERMIA_STAGE_DEATH 300.15

#define CARDIAC_ARREST_TIMEOUT 60
#define HEART_RATE_FATAL_HIGH 205
#define HEART_RATE_FATAL_LOW 45
#define BLOOD_PRESSURE_FATAL_LOW 53.33333333 // 60/40 Avg. Blood Pressure
#define BLOOD_PRESSURE_FATAL_HIGH 160 // 180/120 Avg. Blood Pressure
#define BLOOD_PRESSURE_LOW_UPPER 80
#define BLOOD_PRESSURE_LOW_LOWER 40
#define HEART_RATE_LOW_UPPER 50
#define HEART_RATE_LOW_LOWER 30

// Electrical
    // US
#define SUIT_THEVENIN_VOLTAGE_US 18
#define SUIT_BATTERY_CAP_US (40*3600) // Amp Hrs per second
#define SUIT_BASE_POWER_DRAW_US 52 // Watts (Electrical)
#define SUIT_MIN_PUMP_POWER_US 50 // Watts (Electrical)
#define SUIT_MAX_PUMP_POWER_US 150 // Watts (Electrical)
    // PRC

// HUDs
#define DEFAULT_IFF_RANGE 5000 // Metres
#define HUMAN_DANGEROUS_TEMPS [288.15,312.15] // For HUD danger display. Rename
#define NORMAL_TEMP 294.15 // 21C in Kelvin | Note: Rename this, belongs to the HUD pbo
