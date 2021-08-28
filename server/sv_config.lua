-------------------------------------
--/* Script Made by Hayden#6789 */ --
------------------------------------- 

Server = {}

Server.payMax = 100 -- Min money given
Server.payMin = 150 -- Max Money given

Server.Cooldown = 5 -- Seconds, how long cooldown b4 the same store can b robbed

Server.RobWeapons = { -- WEAPONS THAT CAN ROB THE STORE 
-- If you're a dev and reading this, I use the IsPedArmed native on the client, I just double check via the server and a for loop to ensure that the ped actually has a weapon listed below
-- Do not hate me for being safe :)
    GetHashKey('WEAPON_PISTOL'),
    GetHashKey('weapon_pistol_mk2'),
    GetHashKey('weapon_combatpistol'),
    GetHashKey('weapon_appistol'),
    GetHashKey('weapon_pistol50'),
    GetHashKey('weapon_snspistol'),
    GetHashKey('weapon_snspistol_mk2'),
    GetHashKey('weapon_heavypistol'),
    GetHashKey('weapon_vintagepistol'),
    GetHashKey('weapon_marksmanpistol'),
    GetHashKey('weapon_revolver'),
    GetHashKey('weapon_revolver_mk2'),
    GetHashKey('weapon_doubleaction'),
    GetHashKey('weapon_raypistol'),
    GetHashKey('weapon_ceramicpistol'),
    GetHashKey('weapon_navyrevolver'),
    GetHashKey('weapon_gadgetpistol'),
    
    -- Submachine Guns
    GetHashKey('weapon_microsmg'),
    GetHashKey('weapon_smg'),
    GetHashKey('weapon_smg_mk2'),
    GetHashKey('weapon_assaultsmg'),
    GetHashKey('weapon_combatpdw'),
    GetHashKey('weapon_machinepistol'),
    GetHashKey('weapon_minismg'),
    GetHashKey('weapon_raycarbine'),

    -- Shotguns
    GetHashKey('weapon_pumpshotgun'),
    GetHashKey('weapon_pumpshotgun_mk2'),
    GetHashKey('weapon_sawnoffshotgun'),
    GetHashKey('weapon_assaultshotgun'),
    GetHashKey('weapon_bullpupshotgun'),
    GetHashKey('weapon_musket'),
    GetHashKey('weapon_heavyshotgun'),
    GetHashKey('weapon_dbshotgun'),
    GetHashKey('weapon_autoshotgun'),
    GetHashKey('weapon_combatshotgun'),

    -- Assault Rifles
    GetHashKey('weapon_assaultrifle'),
    GetHashKey('weapon_assaultrifle_mk2'),
    GetHashKey('weapon_carbinerifle'),
    GetHashKey('weapon_carbinerifle_mk2'),
    GetHashKey('weapon_advancedrifle'),
    GetHashKey('weapon_specialcarbine'),
    GetHashKey('weapon_specialcarbine_mk2'),
    GetHashKey('weapon_bullpuprifle'),
    GetHashKey('weapon_bullpuprifle_mk2'),
    GetHashKey('weapon_compactrifle'),
    GetHashKey('weapon_militaryrifle'),

    -- Light machine guns
    GetHashKey('weapon_mg'),
    GetHashKey('weapon_combatmg'),
    GetHashKey('weapon_combatmg_mk2'),
    GetHashKey('weapon_gusenberg'),

    -- Sniper Rifles
    GetHashKey('weapon_sniperrifle'),
    GetHashKey('weapon_heavysniper'),
    GetHashKey('weapon_heavysniper_mk2'),
    GetHashKey('weapon_marksmanrifle'),
    GetHashKey('weapon_marksmanrifle_mk2'),

    -- Heavy Weapons
    GetHashKey('weapon_rpg'),
    GetHashKey('weapon_grenadelauncher'),
    GetHashKey('weapon_grenadelauncher_smoke'),
    GetHashKey('weapon_minigun'),
    GetHashKey('weapon_firework'),
    GetHashKey('weapon_railgun'),
    GetHashKey('weapon_hominglauncher'),
    GetHashKey('weapon_compactlauncher'),
    GetHashKey('weapon_rayminigun'),
}

Server.RequiredCops = 1 -- Required cops to rob store
Server.SetTimer = 5 -- IN seconds, how long it takes to rob