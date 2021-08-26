Config = {}

Config.NPC = { -- Shops must have unique IDs, as the table itterates through each ID
    [1] = {
        ['id'] = 0,
        ['Hash'] = "mp_m_shopkeep_01", -- Hash of the shop keeper ped
        ['Coords'] = {x = 1960.1, y = 3739.9, z = 31.3}, -- Coords of the ped
        ['Heading'] = 360, -- Heading of the ped
        ['NetworkSync'] = true, -- Leave
        ['TextLoc'] = {x = 1960.1, y = 3739.9, z = 31.0}, -- Location of where you want the text to show on the shop keeper
        ['Robbed'] = false, -- Do not touch
        ['BlipLoc'] = vector3(1960.1,3739.9,31.3), -- Location of blips for store
    },
    [2] = {
        ['id'] = 0,
        ['Hash'] = "mp_m_shopkeep_01", -- Hash of the shop keeper ped
        ['Coords'] = {x = 1991.6, y = 3769.2, z = 31.3}, -- Coords of the ped
        ['Heading'] = 100, -- Heading of the ped
        ['NetworkSync'] = true, -- Leave
        ['TextLoc'] = {x = 1991.6, y = 3769.2, z = 31.0}, -- Location of where you want the text to show on the shop keeper
        ['Robbed'] = false, -- Do not touch
        ['BlipLoc'] = vector3(1991.6, 3769.2,  31.3), -- Location of blips for store
    },
}

Config.Blips = true -- Whether to show blips on map of the store or not
Config.Key = 38 -- Actual FiveM key to start robbery (get it from https://docs.fivem.net/docs/game-references/controls/)
Config.ContextKey = "E" -- THe Key that is shown as the key to start the robbery, this is just a UI benefit




