-- UI
-- Notifications
-- exports['mythic_notify']:SendAlert('type', 'message')
ESX = nil

local PlayerData = {}
isSpawned = false 
talking = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	TriggerServerEvent('esx_jobnumbers:setjobnumbers', job)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    TriggerServerEvent('hayden_store:countPolice')
end)

CreateThread(function()        
    while true do
        Wait(0) 
        pX, pY, pZ = table.unpack(GetEntityCoords(PlayerPedId(), true))
        aiming = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))       

        for i = 1, #Config.NPC do 
            sX = Config.NPC[i]['Coords'].x
            sY = Config.NPC[i]['Coords'].y
            sZ = Config.NPC[i]['Coords'].z
            
            tL = Config.NPC[i]['TextLoc'].x
            tL2 = Config.NPC[i]['TextLoc'].y
            tL3 = Config.NPC[i]['TextLoc'].z

            distance = GetDistanceBetweenCoords(pX,pY,pZ,sX,sY,sZ, false)
            ply = GetPlayerPed(-1)
            
            if distance < 3 then               
                -- Draw Ped UI
                if aiming then 
                    Draw3DText( tL, tL2 , tL3, "Press " .. Config.ContextKey .. " to threaten shop keeper", 4, 0.1, 0.1)
                    if IsControlJustPressed(0, Config.Key) then
                        TriggerServerEvent('hayden_store:robClerk', i)
                    end 
                end
            end
        end 
    end 
end)

RegisterNetEvent('hayden_store:welcomeNPC')
AddEventHandler('hayden_store:welcomeNPC', function(i)
    PlayPedAmbientSpeechWithVoiceNative(Config.NPC[i]['id'], "SHOP_GREET", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 1) 
end)

RegisterNetEvent('hayden_store:cya')
AddEventHandler('hayden_store:cya', function(i)
    PlayPedAmbientSpeechWithVoiceNative(Config.NPC[i]['id'], "SHOP_GOODBYE", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 1)
end)

RegisterNetEvent('hayden_store:stopAnim')
AddEventHandler('hayden_store:stopAnim', function()
    local pid = PlayerPedId()
    ClearPedTasks(pid)
end)

RegisterNetEvent('hayden_store:npcAnim')
AddEventHandler('hayden_store:npcAnim', function(i)
    
    if not HasAnimDictLoaded("oddjobs@shop_robbery@rob_till") then
        RequestAnimDict("oddjobs@shop_robbery@rob_till")
        while not HasAnimDictLoaded("oddjobs@shop_robbery@rob_till") do
            -- Wait
            Wait(0)
        end
    end

    TaskPlayAnim(Config.NPC[i]['id'], "oddjobs@shop_robbery@rob_till", "loop", 8.0, -8.0, -1, 1, 0, false, false, false)
    PlayPedAmbientSpeechWithVoiceNative(Config.NPC[i]['id'], "SHOP_SCARED", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 1)
end)

RegisterNetEvent('hayden_store:clearTask')
AddEventHandler('hayden_store:clearTask', function(i)
    ClearPedTasks(Config.NPC[i]['id'])
end)

CreateThread(function()

    if Config.Blips then 
        for blipCreate = 1, #Config.NPC do
            local locationPos = Config.NPC[blipCreate]['BlipLoc']
    
            local blip = AddBlipForCoord(locationPos)
    
            SetBlipSprite (blip, 156)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, 0.8)
            SetBlipColour (blip, 48)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Shop Clerk")
            EndTextCommandSetBlipName(blip)
        end
    end 

    -- This is probably a shitty way of doing this
    for i = 1, #Config.NPC do 
        modelHash = GetHashKey(Config.NPC[i]['Hash'])
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(1)
        end

        created_ped = CreatePed(0, modelHash , Config.NPC[i]['Coords'].x, Config.NPC[i]['Coords'].y, Config.NPC[i]['Coords'].z, Config.NPC[i]['Heading'], Config.NPC[i]['NetworkSync'])
        FreezeEntityPosition(created_ped, true)
        SetEntityInvincible(created_ped, true)
        SetBlockingOfNonTemporaryEvents(created_ped, true)
        Config.NPC[i]['id'] = created_ped
        print(Config.NPC[i]['id'])
        isSpawned = true
    end 

end)