class exterra_statemachine {
    list = QUOTE(call ACEFUNC(common,getLocalUnits));
    skipNull = 1;
    class Default {
        onState = QFUNC(handleStateDefault);
        class SuitActivation {
            targetState = "SuitActivated";
            events[] = {QEGVAR(lifesupport,suitActivated)};
        };
    };
    class SuitActivated {
        onStateEntered = QFUNC(startSuitBootup);
        onStateLeaving = QFUNC(startSuitShutdown);
        onState = QFUNC(handleStateDefault);
        class SuitDeactivation {
            targetState = "Default";
            events[] = {QEGVAR(lifesupport,suitDeactivated)};
        };
    };
    class Dead {
        // When the unit is killed it's no longer handled by the statemachine
        //onStateEntered = QFUNC(enteredStateDeath);
    };
};
