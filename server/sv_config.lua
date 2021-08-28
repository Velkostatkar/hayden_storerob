-------------------------------------
--/* Script Made by Hayden#6789 */ --
------------------------------------- 

Server = {}

Server.payMax = 100 -- Min money given
Server.payMin = 150 -- Max Money given

Server.Cooldown = 5 -- Seconds, how long cooldown b4 the same store can b robbed

Server.RobWeapons = { -- WEAPONS THAT CAN ROB THE STORE
    GetHashKey('WEAPON_PISTOL'),
    GetHashKey('WEAPON_ASSAULTRIFLE')
}

Server.RequiredCops = 1 -- Required cops to rob store
Server.CountCops = 5 -- In seconds, how many seconds b4 the server counts the cops and updates the value
Server.SetTimer = 5 -- IN seconds, how long it takes to rob