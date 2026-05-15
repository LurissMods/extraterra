
/*---------------------------------- General defines ----------------------------------*/
//#define UNDEF_SUIT_FACTION -1
#define NO_SUIT_FACTION 0
#define US_SUIT_FACTION 1
#define PRC_SUIT_FACTION 2

/*---------------------------------- Air defines ----------------------------------*/
// US
    #define REBREATHER_EFFICIENCY_US 0.875 // Percentage
// PRC

/*---------------------------------- Thermal defines ----------------------------------*/
// US
    #define DEFAULT_MAX_ACTIVE_COOL_US 1400 // Watts (Thermal) (300 W metabolic + 950 W solar)
    #define DEFAULT_MAX_ACTIVE_HEAT_US 200 // Watts (Thermal) (-50 Celcius as the rough 0 point for the heater. Driven more by gameplay balance than anything).
// PRC

/*---------------------------------- Electrical defines ----------------------------------*/
// US
    /*
    * HMD = 20 watts
    * Life support = 72 watts
    */
    #define SUIT_THEVENIN_VOLTAGE_US 20
    //#define SUIT_BATTERY_CAP_US (40*3600) // Amp Hrs per second
    #define SUIT_BASE_POWER_DRAW_US 92 // Watts (Electrical)
    #define SUIT_MIN_THERMAL_CONTROL_POWER_US 50 // Watts (Electrical)
    #define SUIT_MAX_THERMAL_CONTROL_POWER_US 150 // Watts (Electrical)
    #define SUIT_NV_WATTAGE_US 10 // Watts (Electrical)
    #define SUIT_TV_WATTAGE_US 10 // Watts (Electrical)
// PRC
