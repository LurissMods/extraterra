class exterra_lifesupport_statemachine {
    list = QUOTE(call ACEFUNC(common,getLocalUnits));
    skipNull = 1;
    class Default {
        onState = QFUNC(handleStateDefault);
        /*class Injury {
            targetState = "Injured";
            events[] = {QEGVAR(medical,injured), QEGVAR(medical,LoweredVitals)};
        };*/
    };
    class Dead {
        // When the unit is killed it's no longer handled by the statemachine
        //onStateEntered = QFUNC(enteredStateDeath);
    };
};
