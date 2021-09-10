-------------------------------------
--/* Script Made by Hayden#6789 */ --
------------------------------------- 

Server = {}

Server.payMax = 20000 -- Max robbery payout
Server.payMin = 25000 -- Min robbery payout

Server.safeMax = 50000 -- Max Safe payout
Server.safeMin = 30000 -- Min safe Payout

-- Time before a store can be robbed again (seconds)
Server.Cooldown = 1500

-- Time before a safe can be robbed again (seconds)
Server.SafeCooldown = 1500

-- Time for the robbery to complete (seconds)
Server.SetTimer = 300 

 -- Required online cops to rob a store
Server.RequiredCops = 0

-- Chance for the store owner to fight back (percentage)
Server.AttackChance = 5

-- Allowed Weapons for the robbery to start
Server.RobWeapons = {

    -- Pistols
    `weapon_pistol`,
    `weapon_pistol_mk2`,
    `weapon_combatpistol`,
    `weapon_appistol`,
    `weapon_pistol50`,
    `weapon_snspistol`,
    `weapon_snspistol_mk2`,
    `weapon_heavypistol`,
    `weapon_vintagepistol`,
    `weapon_marksmanpistol`,
    `weapon_revolver`,
    `weapon_revolver_mk2`,
    `weapon_doubleaction`,
    `weapon_raypistol`,
    `weapon_ceramicpistol`,
    `weapon_navyrevolver`,
    `weapon_gadgetpistol`,
    
    -- Submachine Guns
    `weapon_microsmg`,
    `weapon_smg`,
    `weapon_smg_mk2`,
    `weapon_assaultsmg`,
    `weapon_combatpdw`,
    `weapon_machinepistol`,
    `weapon_minismg`,
    `weapon_raycarbine`,

    -- Shotguns
    `weapon_pumpshotgun`,
    `weapon_pumpshotgun_mk2`,
    `weapon_sawnoffshotgun`,
    `weapon_assaultshotgun`,
    `weapon_bullpupshotgun`,
    `weapon_musket`,
    `weapon_heavyshotgun`,
    `weapon_dbshotgun`,
    `weapon_autoshotgun`,
    `weapon_combatshotgun`,

    -- Assault Rifles
    `weapon_assaultrifle`,
    `weapon_assaultrifle_mk2`,
    `weapon_carbinerifle`,
    `weapon_carbinerifle_mk2`,
    `weapon_advancedrifle`,
    `weapon_specialcarbine`,
    `weapon_specialcarbine_mk2`,
    `weapon_bullpuprifle`,
    `weapon_bullpuprifle_mk2`,
    `weapon_compactrifle`,
    `weapon_militaryrifle`,

    -- Light machine guns
    `weapon_mg`,
    `weapon_combatmg`,
    `weapon_combatmg_mk2`,
    `weapon_gusenberg`,

    -- Sniper Rifles
    `weapon_sniperrifle`,
    `weapon_heavysniper`,
    `weapon_heavysniper_mk2`,
    `weapon_marksmanrifle`,
    `weapon_marksmanrifle_mk2`,

    -- Heavy Weapons
    `weapon_rpg`,
    `weapon_grenadelauncher`,
    `weapon_grenadelauncher_smoke`,
    `weapon_minigun`,
    `weapon_firework`,
    `weapon_railgun`,
    `weapon_hominglauncher`,
    `weapon_compactlauncher`,
    `weapon_rayminigun`,
}