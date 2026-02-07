class exterra_weaponSounds_m2Carbine_Closure_SoundShader
{
	samples[] = {{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_closure1.wss",1},{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_closure2.wss",1}};
	volume = 0.17782794;
	range = 5;
};
class exterra_weaponSounds_m2Carbine_closeShot_SoundShader
{
	samples[] = {{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_close1.wss",1},{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_close2.wss",1},{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_close3.wss",1}};
	volume = 1.5;
	range = 50;
	rangeCurve = "closeShotCurve";
};
class exterra_weaponSounds_m2Carbine_midShot_SoundShader
{
	samples[] = {{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_med1.wss",1},{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_med2.wss",1},{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_med3.wss",1}};
	volume = 0.7943282;
	range = 1800;
	rangeCurve[] = {{0,0.2},{50,1},{300,0},{1800,0}};
};
class exterra_weaponSounds_m2Carbine_distShot_SoundShader
{
	samples[] = {{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_far1.wss",1},{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_far2.wss",1},{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_far3.wss",1}};
	volume = 1.0;
	range = 1800;
	rangeCurve[] = {{0,0},{50,0},{300,1},{1800,1}};
};
class exterra_weaponSounds_m2Carbine_tailInterior_SoundShader
{
	samples[] = {{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_tail_interior.wss",1}};
	volume = "0.7 * interior";
	range = 500;
	limitation = 0;
};
class exterra_weaponSounds_m2Carbine_tailTrees_SoundShader
{
	samples[] = {{"A3\Sounds_F\arsenal\weapons\Rifles\MX\MX_tailTrees.wss",1}};
	volume = "(1-interior/1.4)*trees/3";
	range = 1800;
	limitation = 1;
};
class exterra_weaponSounds_m2Carbine_tailForest_SoundShader
{
	samples[] = {{"A3\Sounds_F\arsenal\weapons\Rifles\MX\MX_tailForest.wss",1}};
	volume = "(1-interior/1.4)*forest/3";
	range = 1800;
	limitation = 1;
};
class exterra_weaponSounds_m2Carbine_tailMeadows_SoundShader
{
	samples[] = {{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_tail_meadow.wss",1}};
	volume = "(1-interior/1.4)*(meadows/2 max sea/2)/3";
	range = 1800;
	limitation = 1;
};
class exterra_weaponSounds_m2Carbine_tailHouses_SoundShader
{
	samples[] = {{"A3\Sounds_F\arsenal\weapons\Rifles\MX\MX_tailHouses.wss",1}};
	volume = "(1-interior/1.4)*houses/3";
	range = 1200;
	limitation = 1;
};
class exterra_weaponSounds_m2Carbine_silencerShot_SoundShader
{
	samples[] = {{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_closeVacuum1.wss",1},{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_closeVacuum2.wss",1},{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_closeVacuum3.wss",1}};
	volume = 1.5;
	range = 50;
	rangeCurve = "closeShotCurve";
};
class exterra_weaponSounds_m2Carbine_silencerTailForest_SoundShader
{
	samples[] = {{"A3\Sounds_F\arsenal\weapons\Rifles\MX\MX_silencerTailForest.wss",1}};
	volume = "(1-interior/1.4)*forest/3";
	range = 10;
	rangeCurve[] = {{0,1},{10,0.3}};
	limitation = 1;
};
class exterra_weaponSounds_m2Carbine_silencerTailHouses_SoundShader
{
	samples[] = {{"A3\Sounds_F\arsenal\weapons\Rifles\MX\MX_silencerTailHouses.wss",1}};
	volume = "(1-interior/1.4)*houses/3";
	range = 10;
	rangeCurve[] = {{0,1},{10,0}};
	limitation = 1;
};
class exterra_weaponSounds_m2Carbine_silencerTailInterior_SoundShader
{
	samples[] = {{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_tailVacuum_interior.wss",1}};
	volume = "interior";
	range = 25;
	rangeCurve[] = {{0,1},{12.5,0.5},{25,0}};
	limitation = 1;
};
class exterra_weaponSounds_m2Carbine_silencerTailMeadows_SoundShader
{
	samples[] = {{"z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_tailVacuum_meadow.wss",1}};
	volume = "(1-interior/1.4)*(meadows/2 max sea/2)/3";
	range = 50;
	rangeCurve[] = {{0,1},{50,0.3}};
	limitation = 1;
};
class exterra_weaponSounds_m2Carbine_silencerTailTrees_SoundShader
{
	samples[] = {{"A3\Sounds_F\arsenal\weapons\Rifles\MX\MX_silencerTailTrees.wss",1}};
	volume = "(1-interior/1.4)*trees/3";
	range = 10;
	rangeCurve[] = {{0,1},{10,0.3}};
	limitation = 1;
};
