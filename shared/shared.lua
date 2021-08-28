-------------------------------------
--/* Script Made by Hayden#6789 */ --
------------------------------------- 

Config = {}

-- The keys aren't actually utilised, was more or so for testing
Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config.NPC = { -- Shops must have unique IDs, as the table itterates through each ID
    [1] = {
        ['id'] = 0, -- This is the ID the specific shop is assigned on ped creation, do not touch
        ['Name'] = "Sandy Store", -- This is the name of the shop shown on the alert
        ['Hash'] = "mp_m_shopkeep_01", -- Hash of the shop keeper ped
        ['Coords'] = {x = 1960.1, y = 3739.9, z = 31.3}, -- Coords of the ped
        ['Heading'] = 304.25, -- Heading of the ped
        ['NetworkSync'] = false, -- Leave
        ['TextLoc'] = {x = 1960.1, y = 3739.9, z = 31.0}, -- Location of where you want the text to show on the shop keeper
        ['Robbed'] = false, -- Do not touch
        ['BlipLoc'] = vector3(1960.1,3739.9,31.3), -- Location of blips for store
    },
    [2] = {
        ['id'] = 0, -- This is the ID the specific shop is assigned on ped creation, do not touch
        ['Name'] = "Paleto Store",
        ['Hash'] = "mp_m_shopkeep_01", -- Hash of the shop keeper ped
        ['Coords'] = {x = 1728.92, y = 6417.29, z = 34.04}, -- Coords of the ped
        ['Heading'] = 241.35, -- Heading of the ped
        ['NetworkSync'] = false, -- Leave
        ['TextLoc'] = {x = 1728.92, y = 6417.29, z = 34.04}, -- Location of where you want the text to show on the shop keeper
        ['Robbed'] = false, -- Do not touch
        ['BlipLoc'] = vector3(1728.92, 6417.29, 34.04), -- Location of blips for store
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
    }
}


