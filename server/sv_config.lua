-------------------------------------
--/* Script Made by Hayden#6789 */ --
------------------------------------- 

Server = {}

Server.payMax = 100 -- Min money given
Server.payMin = 150 -- Max Money given

Server.Cooldown = 5 -- Seconds, how long cooldown b4 the same store can b robbed

Server.RequiredCops = 1 -- Required cops to rob store
Server.SetTimer = 5 -- IN seconds, how long it takes to rob
Server.AttackChance = 100 -- Chance of the ped fighting back, higher the number = lower the chance (if the value his higher then 5 it'll do a normal rob, if it's lower then five it will attack)

Server.RobWeapons = { -- WEAPONS THAT CAN ROB THE STORE 
-- If you're a dev and reading this, I use the IsPedArmed native on the client, I just double check via the server and a for loop to ensure that the ped actually has a weapon listed below
-- Do not hate me for being safe :)
    `WEAPON_PISTOL`,
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