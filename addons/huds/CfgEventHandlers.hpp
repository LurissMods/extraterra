class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
    };
};

class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(call FUNC(shutdownHUD_US););
            exclude[] = {IGNORE_BASE_UAVPILOTS};
        };
    };
};

/*class Extended_Local_EventHandlers {
    class CAManBase {
        class ADDON {
            local = QUOTE(
                call FUNC(initHUD_US);
                call FUNC(initPFH_HudInertia)
            );
            exclude[] = {IGNORE_BASE_UAVPILOTS};
        };
    };
};*/
