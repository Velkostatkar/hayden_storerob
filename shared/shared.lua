Config = {}

Config.NPC = {
    [1] = {
        ['id'] = 1,
        ['Hash'] = "mp_m_shopkeep_01", -- Hash of the shop keeper ped
        ['Coords'] = {x = 1960.1, y = 3739.9, z = 31.3}, -- Coords of the ped
        ['Heading'] = 360, -- Heading of the ped
        ['NetworkSync'] = true, -- Leave
        ['TextLoc'] = {x = 1960.1, y = 3739.9, z = 31.0}, -- Location of where you want the text to show on the shop keeper
        ['Robbed'] = false, -- Do not touch
        ['BlipLoc'] = vector3(1960.1,3739.9,31.3), -- Location of blips for store
    },
    [2] = {
        ['id'] = 2,
        ['Hash'] = "mp_m_shopkeep_01", -- Hash of the shop keeper ped
        ['Coords'] = {x = 1991.6, y = 3769.2, z = 31.3}, -- Coords of the ped
        ['Heading'] = 100, -- Heading of the ped
        ['NetworkSync'] = true, -- Leave
        ['TextLoc'] = {x = 1991.6, y = 3769.2, z = 31.0}, -- Location of where you want the text to show on the shop keeper
        ['Robbed'] = false, -- Do not touch
        ['BlipLoc'] = vector3(1991.6, 3769.2,  31.3), -- Location of blips for store
    },
}

Config.Blips = true -- Whether to show blips on map or not
Config.Key = 38 -- Actual FiveM key to start robbery
Config.ContextKey = "E" -- Just UI Stuff




