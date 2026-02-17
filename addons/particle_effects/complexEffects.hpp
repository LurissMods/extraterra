class exterra_particle_effects_vaccumGunEffects
{
	class exterra_particle_effects_muzzleRefract0
	{
		simulation = "particles";
		type = "exterra_particle_effects_muzzleRefract";
		position[] = { 0,0,0 };
		intensity = 100;
		interval = 1;
		lifeTime = 0.05;
	};
	class exterra_particle_effects_muzzleDust0
	{
		simulation = "particles";
		type = "exterra_particle_effects_muzzleDust";
		position[] = { 0,0,0 };
		//enabled = "(humidity interpolate [0.2,0.20001,1,0]) * (distToSurface interpolate [1.0,1.01,1,0])";
		intensity = 1;
		interval = 1;
		lifeTime = 0.05;
	};
};

class exterra_particle_effects_impactRegolith1
{
	class exterra_particle_effects_regolithImpactRocks0
	{
		simulation = "particles";
		type = "exterra_particle_effects_regolithImpactRocks";
		position[] = { 0,0,0 };
		intensity = 100;
		interval = 1;
		lifeTime = 1.00;
	};
	class exterra_particle_effects_regolithImpactDust0
	{
		simulation = "particles";
		type = "exterra_particle_effects_regolithImpactDust";
		position[] = { 0,0,0 };
		//enabled = "(humidity interpolate [0.2,0.20001,1,0]) * (distToSurface interpolate [1.0,1.01,1,0])";
		intensity = 1;
		interval = 1;
		lifeTime = 1.00;
	};
};
