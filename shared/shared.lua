-------------------------------------
--/* Script Made by Hayden#6789 */ --
------------------------------------- 

Config = {}

Config.NPC = { -- Shops must have unique IDs, as the table itterates through each ID
    [1] = {
        ['id'] = created_ped, -- This is the ID the specific shop is assigned on ped creation, do not touch
        ['Name'] = "Sandy Store", -- This is the name of the shop shown on the alert
        ['NetworkSync'] = false, -- Leave
        ['Robbed'] = false, -- Do not touch
        ['Hash'] = `mp_m_shopkeep_01`, -- Hash of the shop keeper ped
        ['Weapon'] = `WEAPON_PISTOL`,
        ['Heading'] = 304.25, -- Heading of the ped
        ['Coords'] = vector3(1960.1, 3739.9, 31.3), -- Coords of the ped
        ['TextLoc'] = vector3(1960.1, 3739.9,31.0), -- Location of where you want the text to show on the shop keeper
        ['BlipLoc'] = vector3(1960.1,3739.9,31.3), -- Location of blips for store
        ['safeID'] = safeCheck, -- The specific Safe ID - used to network serverside.
        ['safeHash'] = `p_v_43_safe_s`, -- Hash of the safe, shouldn't really be changed but can be
        ['wantSafe'] = true, -- Whether this store should spawn a safe
        ['safeCoords'] = vector3(1958.16,3748.53,31.34), -- Safe coords
        ['safeText'] = vector3(1958.16,3748.53,30.34), -- Location of safe text
        ['safeHeading'] = 29.12, -- heading of the safe
        ['safeRobbed'] = false, -- Do not touch
    },
    [2] = {
        ['id'] = created_ped, -- This is the ID the specific shop is assigned on ped creation, do not touch
        ['Name'] = "Paleto Store",
        ['NetworkSync'] = false, -- Leave
        ['Robbed'] = false, -- Do not touch
        ['Hash'] = `mp_m_shopkeep_01`, -- Hash of the shop keeper ped
        ['Weapon'] = `WEAPON_PISTOL`, -- The weapon the ped will pull out 
        ['Heading'] = 241.35, -- Heading of the ped
        ['Coords'] = vector3(1728.92, 6417.29, 34.04), -- Coords of the ped
        ['TextLoc'] = vector3(1728.92, 6417.29, 34.04), -- Location of where you want the text to show on the shop keeper
        ['BlipLoc'] = vector3(1728.92, 6417.29, 34.04), -- Location of blips for store
        ['safeID'] = safeCheck, -- The specific Safe ID - used to network serverside.
        ['safeHash'] = `p_v_43_safe_s`, -- Hash of the safe, shouldn't really be changed but can be
        ['wantSafe'] = true, -- Whether this store should spawn a safe
        ['safeCoords'] = vector3(1734.04,6421.5,34.04), -- Safe coords
        ['safeText'] = vector3(1734.04,6421.5,33.04), -- Location of safe text
        ['safeHeading'] = 335.59, -- heading of the safe
        ['safeRobbed'] = false, -- Do not touch
    },
    [3] = {
        ['id'] = created_ped, -- This is the ID the specific shop is assigned on ped creation, do not touch
        ['Name'] = "Grape Seed Store",
        ['NetworkSync'] = false, -- Leave
        ['Robbed'] = false, -- Do not touch
        ['Hash'] = `mp_m_shopkeep_01`, -- Hash of the shop keeper ped
        ['Weapon'] = `WEAPON_PISTOL`, -- The weapon the ped will pull out 
        ['Heading'] = 317.21, -- Heading of the ped
        ['Coords'] = vector3(1698.2, 4922.8, 41.1), -- Coords of the ped
        ['TextLoc'] = vector3(1698.2, 4922.8, 41.1), -- Location of where you want the text to show on the shop keeper
        ['BlipLoc'] = vector3(1698.2, 4922.8,42.1), -- Location of blips for store
        ['safeID'] = safeCheck, -- The specific Safe ID - used to network serverside.
        ['safeHash'] = `p_v_43_safe_s`, -- Hash of the safe, shouldn't really be changed but can be
        ['wantSafe'] = true, -- Whether this store should spawn a safe
        ['safeCoords'] = vector3(1707.29, 4918.92, 41.06), -- Safe coords
        ['safeText'] = vector3(1707.29, 4918.92, 40.06), -- Location of safe text
        ['safeHeading'] = 239.12, -- heading of the safe
        ['safeRobbed'] = false, -- Do not touch
    },
    [4] = {
        ['id'] = created_ped, -- This is the ID the specific shop is assigned on ped creation, do not touch
        ['Name'] = "Sandy Shores road Store",
        ['NetworkSync'] = false, -- Leave
        ['Robbed'] = false, -- Do not touch
        ['Hash'] = `mp_m_shopkeep_01`, -- Hash of the shop keeper ped
        ['Weapon'] = `WEAPON_PISTOL`, -- The weapon the ped will pull out 
        ['Heading'] = 200.06, -- Heading of the ped
        ['Coords'] = vector3(1392.84, 3606.58, 33.98), -- Coords of the ped
        ['TextLoc'] = vector3(1392.84, 3606.58, 33.98), -- Location of where you want the text to show on the shop keeper
        ['BlipLoc'] = vector3(1392.84,3606.58, 34.98), -- Location of blips for store
        ['safeID'] = safeCheck, -- The specific Safe ID - used to network serverside.
        ['safeHash'] = `p_v_43_safe_s`, -- Hash of the safe, shouldn't really be changed but can be
        ['wantSafe'] = true, -- Whether this store should spawn a safe
        ['safeCoords'] = vector3(1392.31,3608.53,33.98), -- Safe coords
        ['safeText'] = vector3(1392.31,3608.53,32.98), -- Location of safe text
        ['safeHeading'] = 288.58, -- heading of the safe
        ['safeRobbed'] = false, -- Do not touch
    },
    [5] = {
        ['id'] = created_ped, -- This is the ID the specific shop is assigned on ped creation, do not touch
        ['Name'] = "Route 68 Store",
        ['NetworkSync'] = false, -- Leave
        ['Robbed'] = false, -- Do not touch
        ['Hash'] = `mp_m_shopkeep_01`, -- Hash of the shop keeper ped
        ['Weapon'] = `WEAPON_PISTOL`, -- The weapon the ped will pull out 
        ['Heading'] = 200.06, -- Heading of the ped
        ['Coords'] = vector3(1165.94, 2710.8, 37.16), -- Coords of the ped
        ['TextLoc'] = vector3(1165.94, 2710.8, 37.16), -- Location of where you want the text to show on the shop keeper
        ['BlipLoc'] = vector3(1165.94, 2710.8, 38.16), -- Location of blips for store
        ['safeID'] = safeCheck, -- The specific Safe ID - used to network serverside.
        ['safeHash'] = `p_v_43_safe_s`, -- Hash of the safe, shouldn't really be changed but can be
        ['wantSafe'] = true, -- Whether this store should spawn a safe
        ['safeCoords'] = vector3(1167.75, 2714.08, 37.16), -- Safe coords
        ['safeText'] = vector3(1167.75, 2714.08, 36.16), -- Location of safe text
        ['safeHeading'] = 90.28, -- heading of the safe
        ['safeRobbed'] = false, -- Do not touch
    },
    [6] = {
        ['id'] = created_ped, -- This is the ID the specific shop is assigned on ped creation, do not touch
        ['Name'] = "Route 68 Store",
        ['NetworkSync'] = false, -- Leave
        ['Robbed'] = false, -- Do not touch
        ['Hash'] = `mp_m_shopkeep_01`, -- Hash of the shop keeper ped
        ['Weapon'] = `WEAPON_PISTOL`, -- The weapon the ped will pull out 
        ['Heading'] = 98.97, -- Heading of the ped
        ['Coords'] = vector3(549.39, 2668.98, 41.16), -- Coords of the ped
        ['TextLoc'] = vector3(549.39, 2668.98, 41.16), -- Location of where you want the text to show on the shop keeper
        ['BlipLoc'] = vector3( 549.39, 2668.98, 42.16), -- Location of blips for store
        ['safeID'] = safeCheck, -- The specific Safe ID - used to network serverside.
        ['safeHash'] = `p_v_43_safe_s`, -- Hash of the safe, shouldn't really be changed but can be
        ['wantSafe'] = true, -- Whether this store should spawn a safe
        ['safeCoords'] = vector3(547.51,2662.65,41.16), -- Safe coords
        ['safeText'] = vector3(547.51,2662.65,40.16), -- Location of safe text
        ['safeHeading'] = 186.77, -- heading of the safe
        ['safeRobbed'] = false, -- Do not touch
    },
    [7] = {
        ['id'] = created_ped, -- This is the ID the specific shop is assigned on ped creation, do not touch
        ['Name'] = "Senora Freeway Store",
        ['NetworkSync'] = false, -- Leave
        ['Robbed'] = false, -- Do not touch
        ['Hash'] = `mp_m_shopkeep_01`, -- Hash of the shop keeper ped
        ['Weapon'] = `WEAPON_PISTOL`, -- The weapon the ped will pull out 
        ['Heading'] = 331.35, -- Heading of the ped
        ['Coords'] = vector3(2676.02, 3280.57, 54.24), -- Coords of the ped
        ['TextLoc'] = vector3(2676.02, 3280.57, 54.24), -- Location of where you want the text to show on the shop keeper
        ['BlipLoc'] = vector3( 2676.02,  3280.57,54.24), -- Location of blips for store
        ['safeID'] = safeCheck, -- The specific Safe ID - used to network serverside.
        ['safeHash'] = `p_v_43_safe_s`, -- Hash of the safe, shouldn't really be changed but can be
        ['wantSafe'] = true, -- Whether this store should spawn a safe
        ['safeCoords'] = vector3(2671.97,3285.78,54.24), -- Safe coords
        ['safeText'] = vector3(2671.97,3285.78,53.24), -- Location of safe text
        ['safeHeading'] = 57.14, -- heading of the safe
        ['safeRobbed'] = false, -- Do not touch
    },
    [8] = {
        ['id'] = created_ped, -- This is the ID the specific shop is assigned on ped creation, do not touch
        ['Name'] = "North Rockford Drive",
        ['NetworkSync'] = false, -- Leave
        ['Robbed'] = false, -- Do not touch
        ['Hash'] = `mp_m_shopkeep_01`, -- Hash of the shop keeper ped
        ['Weapon'] = `WEAPON_PISTOL`, -- The weapon the ped will pull out 
        ['Heading'] = 128.8, -- Heading of the ped
        ['Coords'] = vector3(-1820.27, 794.3, 137.09), -- Coords of the ped
        ['TextLoc'] = vector3(-1820.27, 794.3, 137.09), -- Location of where you want the text to show on the shop keeper
        ['BlipLoc'] = vector3(-1820.27, 794.3, 137.09), -- Location of blips for store
        ['safeID'] = safeCheck, -- The specific Safe ID - used to network serverside.
        ['safeHash'] = `p_v_43_safe_s`, -- Hash of the safe, shouldn't really be changed but can be
        ['wantSafe'] = true, -- Whether this store should spawn a safe
        ['safeCoords'] = vector3(-1828.08,799.77,137.16), -- Safe coords
        ['safeText'] = vector3(-1828.08,799.77,136.16), -- Location of safe text
        ['safeHeading'] = 345.15, -- heading of the safe
        ['safeRobbed'] = false, -- Do not touch
    },
    [9] = {
        ['id'] = created_ped, -- This is the ID the specific shop is assigned on ped creation, do not touch
        ['Name'] = "Great Ocean Hwy",
        ['NetworkSync'] = false, -- Leave
        ['Robbed'] = false, -- Do not touch
        ['Hash'] = `mp_m_shopkeep_01`, -- Hash of the shop keeper ped
        ['Weapon'] = `WEAPON_PISTOL`, -- The weapon the ped will pull out 
        ['Heading'] = 348.84, -- Heading of the ped
        ['Coords'] = vector3(-3244.53, 1000.15, 11.83), -- Coords of the ped
        ['TextLoc'] = vector3(-3244.53, 1000.15, 11.83), -- Location of where you want the text to show on the shop keeper
        ['BlipLoc'] = vector3(-3244.53,1000.15, 11.83), -- Location of blips for store
        ['safeID'] = safeCheck, -- The specific Safe ID - used to network serverside.
        ['safeHash'] = `p_v_43_safe_s`, -- Hash of the safe, shouldn't really be changed but can be
        ['wantSafe'] = true, -- Whether this store should spawn a safe
        ['safeCoords'] = vector3(-3250.41,1003.39,11.83), -- Safe coords
        ['safeText'] = vector3(-3250.41,1003.39,10.83), -- Location of safe text
        ['safeHeading'] = 84.57, -- heading of the safe
        ['safeRobbed'] = false, -- Do not touch
    },
}

Config.Blips = true -- Whether to show blips on map of the store or not
Config.Key = 38 -- Actual FiveM key to start robbery (get it from https://docs.fivem.net/docs/game-references/controls/)
Config.ContextKey = "E" -- THe Key that is shown as the key to start the robbery, this is just a UI benefit

Config.Debug = false -- Debug prints to see if something goes wrong and where

Config.Language = 'en' -- Desired Language for translations, currently only english

Translation = { 
    ['en'] = {
        ['robbing'] = "Alarm has been triggered",
        ['cop_msg'] = "Alarm has been set off at a store, CCTV has caught the criminals face!",
        ['set_waypoint'] = "Set waypoint to the store",
        ['hide_box'] = "Close this box",
        ['playerRobbing'] = "You're now robbing the store! Keep your gun pointed!",
        ['robbery'] = "Store Robbery",
        ['no_cop'] = "Not enough cops on duty to rob the store!",
        ['recent'] = "This store has been robbed recently!",
        ['success'] = "You have successfully robbed the store!",
        ['nowep'] = "It appears you don't have the appropriate weaponry for this task!",
        ['shotNPC'] = "You've shot the NPC, the robbery has been cancelled!",
        ['tooFar'] = "You've gone too far from the store! Robbery cancelled!",
        ['robbedSafe'] = "You've successfully robbed the safe! Run away!",
        ['alreadySafeRobbed'] = "This safe has been robbed recently!",
        ['safe_msg'] = "A safe alarm has been triggered, we've captured CCTV of the criminals face!",
    },

    ['de'] = {
        ['robbing'] = "Alarm wurde ausgelöst",
        ['cop_msg'] = "In einem Geschäft wurde Alarm ausgelöst, CCTV hat das Gesicht des Kriminellen erfasst!",
        ['set_waypoint'] = "Wegpunkt zum Store setzen",
        ['hide_box'] = "Schließen Sie dieses Feld",
        ['playerRobbing'] = "Sie rauben jetzt den Laden aus! Halten Sie Ihre Waffe gerichtet!",
        ['robbery'] = "Ladenraub",
        ['no_cop'] = "Nicht genug Polizisten im Dienst, um den Laden auszurauben!",
        ['recent'] = "Dieser Laden wurde vor kurzem ausgeraubt!",
        ['success'] = "Sie haben den Laden erfolgreich ausgeraubt!",
        ['nowep'] = "Es scheint, dass Sie nicht über die entsprechenden Waffen für diese Aufgabe verfügen!",
        ['shotNPC'] = "Du hast den NPC erschossen, der Raub wurde abgesagt!",
        ['tooFar'] = "Du bist zu weit vom Laden entfernt! Raubüberfall abgesagt!",
        ['robbedSafe'] = "Sie haben den Tresor erfolgreich ausgeraubt! Lauf weg!",
        ['alreadySafeRobbed'] = "Dieser Tresor wurde kürzlich ausgeraubt!",
        ['safe_msg'] = "Ein sicherer Alarm wurde ausgelöst, wir haben CCTV des Kriminellengesichts aufgenommen!",
    },

    ['it'] = {
        ['robbing'] = "L'allarme è stato attivato",
        ['cop_msg'] = "È scattato l'allarme in un negozio, le telecamere hanno fotografato i criminali!",
        ['set_waypoint'] = "Imposta il punto sul gps per il negozio",
        ['hide_box'] = "Chiudi questa finestra",
        ['playerRobbing'] = "Stai derubando il negozio! Tieni l'arma puntata!",
        ['robbery'] = "Rapina al negozio",
        ['no_cop'] = "Non ci sono abbastanza poliziotti per derubare il negozio!",
        ['recent'] = "Questo negozio è stato derubato di recente!",
        ['success'] = "Hai derubato il negozio con successo!",
        ['nowep'] = "Sembra che tu non abbia l'arma adatta per questa rapina!",
        ['shotNPC'] = "Hai sparato al negoziante, la rapina è annullata!",
        ['tooFar'] = "Sei andato troppo lontano dal negozio, la rapina è annullata!",
        ['robbedSafe'] = "Hai derubato con successo la cassaforte! Scappa!",
        ['alreadySafeRobbed'] = "Questa cassaforte è stata recentemente derubata!",
        ['safe_msg'] = "È stato attivato un allarme sicuro, abbiamo registrato le telecamere a circuito chiuso del volto criminale!",
    },
}


