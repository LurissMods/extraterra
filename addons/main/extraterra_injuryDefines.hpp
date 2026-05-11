
/*---------------------------------- Injury macros ----------------------------------*/

//  ------------------------------------ Get var ------------------------------------
//  --- General ---
#define GET_SYMPTOM_HASHMAP(unit) unit getVariable [QEGVAR(injuries,unitHashmap),nil]

//  --- Symptoms ---
#define GET_HR_ADJUST(unit) unit getVariable [QEGVAR(injuries,hrAdjust),nil]
#define GET_BP_ADJUST(unit) unit getVariable [QEGVAR(injuries,bpAdjust),nil]
#define GET_FEVER_ADJUST(unit) unit getVariable [QEGVAR(injuries,unitFeverTempAdjustment),nil]
#define GET_HEAT_RASH_BOOL(unit) unit getVariable [QEGVAR(injuries,heatRash),nil]
#define GET_CYANOSIS_BOOL(unit) unit getVariable [QEGVAR(injuries,cyanosis),nil]
#define GET_SIMPLE_SPO2(unit) unit getVariable [QEGVAR(injuries,unitSimpleSpo2),nil]

//  --- ARS ---
#define GET_ARS_RAD_ARRAY(unit) unit getVariable [QEGVAR(injuries,unitRadLimArray),nil]
#define GET_ARS_RAD_INDEX(unit) unit getVariable [QEGVAR(injuries,unitRadLimIndex),nil]
#define GET_ARS_TIMER(unit) unit getVariable [QEGVAR(injuries,unitArsTimer),nil]
#define GET_ARS_FATIGUE_WEAKNESS_BOOL(unit) unit getVariable [QEGVAR(injuries,unitArsFatigueWeakness),nil]
#define GET_ARS_HYPOTENSION_BOOL(unit) unit getVariable [QEGVAR(injuries,unitArsHypotension),nil]
#define GET_ARS_FEVER_BOOL(unit) unit getVariable [QEGVAR(injuries,unitArsFever),nil]

//  --- Ebullism ---
#define GET_VAC_EXPOSE_TIME(unit) unit getVariable [QEGVAR(injuries,unitVacExposeTime),nil]
#define GET_VAC_EXPOSE_ARRAY(unit) unit getVariable [QEGVAR(injuries,unitVacExposeArray),nil]
#define GET_VAC_EXPOSE_BOOL(unit) unit getVariable [QEGVAR(injuries,unitVacExposeBool),nil]
#define GET_VAC_EXPOSE_EFFECT_BOOL(unit) unit getVariable [QEGVAR(injuries,unitVacExposeEffectBool),nil]

//  --- ACE API ---
#define GET_HR_ADJUST(unit) unit getVariable [QEGVAR(injuries,hrAdjust),0]
#define GET_BP_ADJUST(unit) unit getVariable [QEGVAR(injuries,bpAdjust),0]

//  ------------------------------------ Set var ------------------------------------
//  --- General ---
#define SET_SYMPTOM_HASHMAP(unit,value,sync) unit setVariable [QEGVAR(injuries,unitHashmap),value,sync]

//  --- Symptoms ---
#define SET_HR_ADJUST(unit,value,sync) unit setVariable [QEGVAR(injuries,hrAdjust),value,sync]
#define SET_BP_ADJUST(unit,value,sync) unit setVariable [QEGVAR(injuries,bpAdjust),value,sync]
#define SET_FEVER_ADJUST(unit,value,sync) unit setVariable [QEGVAR(injuries,unitFeverTempAdjustment),value,sync]
#define SET_HEAT_RASH_BOOL(unit,value,sync) unit setVariable [QEGVAR(injuries,heatRash),value,sync]
#define SET_CYANOSIS_BOOL(unit,value,sync) unit setVariable [QEGVAR(injuries,cyanosis),value,sync]
#define SET_SIMPLE_SPO2(unit,value,sync) unit setVariable [QEGVAR(injuries,unitSimpleSpo2),value,sync]

//  --- ARS ---
#define SET_ARS_RAD_ARRAY(unit,value,sync) unit setVariable [QEGVAR(injuries,unitRadLimArray),value,sync]
#define SET_ARS_RAD_INDEX(unit,value,sync) unit setVariable [QEGVAR(injuries,unitRadLimIndex),value,sync]
#define SET_ARS_TIMER(unit,value,sync) unit setVariable [QEGVAR(injuries,unitArsTimer),value,sync]
#define SET_ARS_FATIGUE_WEAKNESS_BOOL(unit,value,sync) unit setVariable [QEGVAR(injuries,unitArsFatigueWeakness),value,sync]
#define SET_ARS_HYPOTENSION_BOOL(unit,value,sync) unit setVariable [QEGVAR(injuries,unitArsHypotension),value,sync]
#define SET_ARS_FEVER_BOOL(unit,value,sync) unit setVariable [QEGVAR(injuries,unitArsFever),value,sync]

//  --- Ebullism ---
#define SET_VAC_EXPOSE_TIME(unit,value,sync) unit setVariable [QEGVAR(injuries,unitVacExposeTime),value,sync]
#define SET_VAC_EXPOSE_ARRAY(unit,value,sync) unit setVariable [QEGVAR(injuries,unitVacExposeArray),value,sync]
#define SET_VAC_EXPOSE_BOOL(unit,value,sync) unit setVariable [QEGVAR(injuries,unitVacExposeBool),value,sync]
#define SET_VAC_EXPOSE_EFFECT_BOOL(unit,value,sync) unit setVariable [QEGVAR(injuries,unitVacExposeEffectBool),value,sync]

//  --- ACE API ---
#define SET_HR_ADJUST(unit,value,sync) unit setVariable [QEGVAR(injuries,hrAdjust),value,sync]
#define SET_BP_ADJUST(unit,value,sync) unit setVariable [QEGVAR(injuries,bpAdjust),value,sync]


/* ---------------------------------- Injury IDs ---------------------------------- */

#define ID_RADIX 7

// Note: Radix must ALWAYS be one greater than the last iId
#define iID_INJURY_AGNOSTIC 0
#define iID_EBULLISM 1
#define iID_ARS 2
#define iID_ASPHYXIATION 3
#define iID_DCS 4
#define iID_HYPERTHERM 5
#define iID_HYPOTHERM 6

/* ---------------------------------- Symptom IDs ---------------------------------- */

#define sID_DEATH 0
#define sID_UNCON 1
#define sID_CARDIAC_ARREST 2
#define sID_PAIN 3
#define sID_NAUSEA 4
#define sID_FATIGUE 5
#define sID_WEAKNESS 6
#define sID_NO_RUN 7
#define sID_NO_JOG 8
#define sID_BP 9
#define sID_HR 10
#define sID_FEVER 11
#define sID_HYPERVENT 12
#define sID_TINNITUS 13
#define sID_BLUR_VIS 14
#define sID_DEAFNESS 15
#define sID_SPO2 16
#define sID_RASH 17
#define sID_LIMP 18
#define sID_CYANOSIS 19

/* ---------------------------------- Ebullism defines ---------------------------------- */

#define VAC_EXPOSE_ARRAY [random [3,7.5,12],random [30,45,60],random [90,105,120]]
#define EBULLISM_TINNITUS_INTENSITY 20
#define EBULLISM_PAIN 0.75
#define EBULLISM_FATIGUE_WEAKNESS 0.75
#define EBULLISM_BLUR_INTENSITY 2
#define EBULLISM_RECOVERY_TIME 300

/* ---------------------------------- ARS defines ---------------------------------- */

#define NO_ARS_TIMER 65535          // #FFFF seconds - Done just to make sure it doesn't cause any weirdness with the less-than checks
#define ARS_STAGE_1_TIMER 14400     // 4 hours
#define ARS_STAGE_2_TIMER 10800     // 3 hours
#define ARS_STAGE_3_TIMER 7200      // 2 hours
#define ARS_STAGE_4_TIMER 3600      // 1 hour
#define ARS_STAGE_5_TIMER 1800      // 30 minutes
#define ARS_STAGE_6_TIMER 1200      // 20 minutes
#define ARS_STAGE_7_TIMER 900       // 15 minutes
#define ARS_STAGE_8_TIMER 720       // 12 minutes
#define ARS_STAGE_9_TIMER 600       // 10 minutes

#define RAD_LIMIT_ARRAY [random [375,562.5,750],random [751,1125.5,1500],random [1501,2250.5,3000],random [3001,4150.5,5300],random [5301,6800.5,8300],random [8301,9650.5,11000],random [11001,13000.5,15000],random [15001,22500.5,30000],random [30001,37500.5,45000]]

/* ---------------------------------- Hyperthermia defines ---------------------------------- */
#define HYPERTHERMIA_BP_LIMIT -1
#define HYPERTHERMIA_HR_LIMIT 75

#define HYPERTHERMIA_HEAT_CRAMPS 310.4
#define HYPERTHERMIA_HEAT_EXHAUSTION 311.15
#define HYPERTHERMIA_HEAT_STROKE 313.15
#define HYPERTHERMIA_DEATH 313.65
//#define HYPERTHERMIA_MAX_HEARTRATE 160
//#define HYPERTHERMIA_MIN_RESISTANCE -85

/* ---------------------------------- Hypothermia defines ---------------------------------- */
#define HYPOTHERMIA_MILD 308.15
#define HYPOTHERMIA_MODERATE 305.15
#define HYPOTHERMIA_SEVERE 301.15
#define HYPOTHERMIA_DEATH 298.15

#define HYPOTHERMIA_HR_LIMIT -50
#define HYPOTHERMIA_PAIN_LIMIT 0.2

/* ---------------------------------- Asphyxiation defines ---------------------------------- */
#define ASPHYX_BREATHE_NONE 0
#define ASPHYX_BREATHE_PARTIAL 0.95
#define ASPHYX_BREATHE_PARTIAL_SIMPLE 0.8
#define ASPHYX_BREATHE_FULL 1
#define ASPHYX_BREATHE_SUIT_NO_AIR 0.35
#define ASPHYX_BREATHE_SUIT_NO_AIR_SIMPLE 0.45
#define ASPHYX_HR_LIMIT 100
#define ASPHYX_BP_LIMIT -0.6
#define ASPHYX_LIN_CONVERSION_SPO2_START 95
#define ASPHYX_FATIGUE_WEAKNESS_LIMIT 1
#define ASPHYX_SPO2_CYANOSIS_LIMIT 85
#define ASPHYX_SPO2_WALK_LIMIT 79
#define ASPHYX_SPO2_LIMP_LIMIT 73
#define ASPHYX_SPO2_CARDIAC_ARREST_LIMIT 67

/* ---------------------------------- Symptom defines ---------------------------------- */

// Fatigue ------------------------------------------
#define FATIGUE_0_MIN 0.25
#define FATIGUE_1_MAX 1.75

// Weakness ------------------------------------------

// Nausea ------------------------------------------
#define NAUSEA_MILD 0
#define NAUSEA_MODERATE 1
#define NAUSEA_SEVERE 2

// Pain ------------------------------------------
#define HEADACHE_MILD 0.05
#define HEADACHE_MODERATE 0.1
#define HEADACHE_SEVERE 0.15
#define MUSCLE_CRAMP_MAX 0.3

// Blood Pressure ------------------------------------------
#define BP_ADJUST_LIMITS 70

// Fever ------------------------------------------
#define HIGH_FEVER_CORE_TEMP 312.75

// SPO2 ------------------------------------------
#define SPO2_MAX_DELTA 1

/* ---------------------------------- Dangerous Vitals defines ---------------------------------- */
#define CARDIAC_ARREST_TIMEOUT 60
#define HEART_RATE_FATAL_HIGH 205
#define HEART_RATE_FATAL_LOW 45
#define BLOOD_PRESSURE_NORMAL 106.6666666667 // 120/80 Avg. Blood Pressure
#define BLOOD_PRESSURE_FATAL_LOW 53.3333333334 // 60/40 Avg. Blood Pressure
#define BLOOD_PRESSURE_FATAL_HIGH 160 // 180/120 Avg. Blood Pressure
#define BLOOD_PRESSURE_LOW_UPPER 80
#define BLOOD_PRESSURE_LOW_LOWER 40
#define HEART_RATE_LOW_UPPER 50
#define HEART_RATE_LOW_LOWER 30
#define SPO2_LOW_UPPER 95
#define SPO2_LOW_LOWER 67

/* ---------------------------------- Misc defines ---------------------------------- */
#define ATMO_BREATHE_ERROR -1
#define ATMO_BREATHE_NONE 0
#define ATMO_BREATHE_FULL 1
#define ATMO_BREATHE_PARTIAL 2
#define ATMO_BREATHE_SUIT 3
