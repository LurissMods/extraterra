# Overview

- Statemachine (statemachine PBO) handles all units and locality changes in multiplayer.
- Units are treated like objects in object oriented programming. They are initalized with attributes via `fnc_initUnit` (lifesupport PBO).
- Statemachine calls `fnc_handleUnitLifesupport` (lifesupport PBO) which handles all unit related life support calculations.
- Injuries have their own PBO (injuries PBO) but are called via `fnc_handleUnitLifesupport`.
- HUD is initalized seperately for the player via postInit (huds PBO). HUD code is handled by a CBA perFrameHandler which can be found in `fnc_initPFH_HUD`.
- HUD class data is stored in .hpp files and initalized via `fnc_initHUD_(faction)` (huds PBO).
- Pressurized areas and radiation are handled by the module PBO.
- Weapon sounds have been seperated into the sound PBO.
- The muffled gunfire sound effect is created using an invisible supressor which can be found in the sound PBO. Logic is handled by `fnc_updateUnitAtmo` (lifesupport PBO).
- Custom casings and particle effects are handled by the particle_effects PBO.

### Notes

- Extraterra makes heavy use of constants (`THIS_IS_A_CONSTANT_EXAMPLE`) and macros (`GET_MACRO(example)`) which can be found in the .hpp files storeds in main (main PBO).
- The huds and lifesupport PBOs are heavily interlinked. They are not intended to be run independently of one another.
- `fnc_updateUnitsNearPlayer` (huds PBO), `fnc_updateLocalTemp` (lifesupport PBO), `fnc_updateDatalink` (statemachine PBO), and `fnc_updatePlayerDatalink` (huds PBO) are computationally demanding by neccesity. They have been heavily tested and optimized, modify these functions with care.
