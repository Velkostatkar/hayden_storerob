-------------------------------------
--/* Script Made by Hayden#6789 */ --
------------------------------------- 
local PlayerData = {}
local textPos = {x = 0.4, y = 0.955 }
local rgb = {r = 255, g = 64, b = 64}
local alpha = 255
local size = 0.6
local font = 4
local display = false 
local actualTime = 0

CreateThread(function()

    if Config.UseQtarget then
            exports.qtarget:AddTargetModel({`p_v_43_safe_s`}, {
                options = {
                    {
                        event = "hayden_store:safeHandle",
                        icon = "fas fa-box-circle-check",
                        label = "Rob Safe",
                        num = 1
                    },
                },
                distance = 2
            })

            exports.qtarget:AddTargetModel({`mp_m_shopkeep_01`}, {
                options = {
                    {
                        event = "hayden_store:clerkHandle",
                        icon = "fas fa-box-circle-check",
                        label = "Rob Clerk",
                        num = 1
                    },
                },
                distance = 2
            })
    end 

    while true do
        Citizen.Wait(0) 
        for i = 1, #Config.NPC do 

            if not Config.UseQtarget then

                pCoords = GetEntityCoords(ESX.PlayerData.ped)
                aiming = GetEntityPlayerIsFreeAimingAt(PlayerId())  

                npcCoords = Config.NPC[i]['Coords']
                safeCoords = Config.NPC[i]['safeCoords']

                if #(pCoords - npcCoords) < 3 then
                    if IsPedArmed(ESX.PlayerData.ped, 7) then               
                        if aiming and not IsPedDeadOrDying(Config.NPC[i]['id']) and GetEntityHealth(Config.NPC[i]['id']) > 0 then 
                            Draw3DText( Config.NPC[i]['TextLoc'], "Press " .. Config.ContextKey .. " to threaten shop keeper", 4, 0.1, 0.1)
                            if IsControlJustPressed(0, Config.Key) then
                                id = Config.NPC[i]['id']
                                FreezeEntityPosition(Config.NPC[i]['id'], false)
                                SetEntityInvincible(Config.NPC[i]['id'], false)
                                TriggerServerEvent('hayden_store:robClerk', i, id, ped)
                            end 
                        end
                    end
                end

                if Config.NPC[i]['wantSafe'] then 
                    if #(pCoords - safeCoords) < 3 then 
                        Draw3DText( Config.NPC[i]['safeText'], "Press " .. Config.ContextKey .. " to rob the safe", 4, 0.1, 0.1)
                        
                        if IsControlJustPressed(0, Config.Key) then
                            local safe = exports["pd-safe"]:createSafe({math.random(0,5)})
                            
                            if safe then
                                TriggerServerEvent('hayden_store:robSafe', i, ped)
                            end 
                        end 
                    end 
                end
            end 

        end

        if display and actualTime ~= false and actualTime ~= true then 
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
            SetTextScale(size, size)
            SetTextWrap(0.0, 1.0)
            SetTextCentre(false)
            SetTextDropshadow(2, 2, 0, 0, 0)
            SetTextEdge(1, 0, 0, 0, 205)
            SetTextEntry("STRING")
            AddTextComponentString("Robbery in progress, time left : ".. actualTime)
            DrawText(textPos.x, textPos.y)
       end

    end
end)

RegisterNetEvent('hayden_store:safeHandle')
AddEventHandler('hayden_store:safeHandle', function()
    for i = 1, #Config.NPC do 
        pCoords = GetEntityCoords(ESX.PlayerData.ped)
        safeCoords = Config.NPC[i]['safeCoords']

        if #(pCoords - safeCoords) < 5 then 
            local safe = exports["pd-safe"]:createSafe({math.random(0,5)})
            if safe then
                TriggerServerEvent('hayden_store:robSafe', i, ped)
            end 
        end 
    end 
end)

RegisterNetEvent('hayden_store:clerkHandle')
AddEventHandler('hayden_store:clerkHandle', function()
    for i = 1, #Config.NPC do 

        pCoords = GetEntityCoords(ESX.PlayerData.ped)
        npcCoords = Config.NPC[i]['Coords']

        if #(pCoords - npcCoords) < 5 then 
            if IsPedArmed(ESX.PlayerData.ped, 7) then               
                if not IsPedDeadOrDying(Config.NPC[i]['id']) and GetEntityHealth(Config.NPC[i]['id']) > 0 then 
                        id = Config.NPC[i]['id']
                        FreezeEntityPosition(Config.NPC[i]['id'], false)
                        SetEntityInvincible(Config.NPC[i]['id'], false)
                        TriggerServerEvent('hayden_store:robClerk', i, id, ped)
                end 
            else 
                print("Player unarmed")
            end
        end 
    end 
end)

RegisterNetEvent('hayden_store:npcAnim')
AddEventHandler('hayden_store:npcAnim', function(i)
    local dict = "oddjobs@shop_robbery@rob_till"
    
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(100)
        end
    end

    TaskPlayAnim(Config.NPC[i]['id'], dict, "loop", 8.0, -8.0, -1, 1, 0, false, false, false)
    RemoveAnimDict(dict)

    PlayPedAmbientSpeechWithVoiceNative(Config.NPC[i]['id'], "SHOP_SCARED", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 1)
    Wait(1000)
    RemoveAnimDict(dict)
end)

RegisterNetEvent('hayden_store:npcGun')
AddEventHandler('hayden_store:npcGun', function(i)
    GiveWeaponToPed(Config.NPC[i]['id'], Config.NPC[i]['Weapon'], 2000, false, true)
    while true do 
        Citizen.Wait(1)
        TaskCombatPed(Config.NPC[i]['id'], ESX.PlayerData.ped, 0, 16 )

        SetPedDropsWeaponsWhenDead(Config.NPC[i]['id'], false)
        
        if IsPedDeadOrDying(Config.NPC[i]['id']) then 
            TriggerServerEvent('hayden_store:cooldown',i)
            return false 
        end

    end 
end)

RegisterNetEvent('hayden_store:checkNPC')
AddEventHandler('hayden_store:checkNPC', function(i)
    if IsPedDeadOrDying(Config.NPC[i]['id']) then 
        DeleteEntity(Config.NPC[i]['id'])
        modelHash = Config.NPC[i]['Hash']
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Citizen.Wait(100)
        end

        local created_ped = CreatePed(4, modelHash , Config.NPC[i]['Coords'].x, Config.NPC[i]['Coords'].y, Config.NPC[i]['Coords'].z, Config.NPC[i]['Heading'], Config.NPC[i]['NetworkSync'], false)
        SetEntityAsMissionEntity(created_ped, true, true)
        SetBlockingOfNonTemporaryEvents(created_ped, true)

        Config.NPC[i]['id'] = created_ped

        FreezeEntityPosition(Config.NPC[i]['id'], true)
        SetEntityInvincible(Config.NPC[i]['id'], true)
    else 
        FreezeEntityPosition(Config.NPC[i]['id'], true)
        SetEntityInvincible(Config.NPC[i]['id'], true)
    end
end)

RegisterNetEvent('hayden_store:callCops')
AddEventHandler('hayden_store:callCops', function(i, ped)

    if ESX.PlayerData.job.name == 'police' then 
        local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(ped)))

        if Config.Debug then 
            print("Store with ID " .. i .. " is being robbed")
        end

        local robB = AddBlipForCoord(Config.NPC[i]['Coords'].x,Config.NPC[i]['Coords'].y,Config.NPC[i]['Coords'].z)
        SetBlipSprite(robB , 161)
        SetBlipScale(robB , 2.0)
        SetBlipColour(robB, 3)
        PulseBlip(robB)

        ESX.ShowAdvancedNotification(Config.NPC[i]['Name'], Translation[Config.Language]['robbing'], Translation[Config.Language]['cop_msg'], mugshotStr, 4)
        UnregisterPedheadshot(mugshot)

        Citizen.Wait(30*1000)
        RemoveBlip(robB)
    end 
end)

RegisterNetEvent('hayden_store:callSafe')
AddEventHandler('hayden_store:callSafe', function(i, ped)
    local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(ped)))

    if Config.Debug then 
        print("Safe with ID " .. i .. " is being robbed")
    end

    local robB = AddBlipForCoord(Config.NPC[i]['safeCoords'].x,Config.NPC[i]['safeCoords'].y,Config.NPC[i]['safeCoords'].z)
    SetBlipSprite(robB , 161)
    SetBlipScale(robB , 2.0)
    SetBlipColour(robB, 3)
    PulseBlip(robB)

    ESX.ShowAdvancedNotification(Config.NPC[i]['Name'], Translation[Config.Language]['robbing'], Translation[Config.Language]['safe_msg'], mugshotStr, 4)
    UnregisterPedheadshot(mugshot)

    Citizen.Wait(30*1000)
    RemoveBlip(robB)
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

    -- This is probably a shit way of doing this
        for i = 1, #Config.NPC do 
            modelHash = Config.NPC[i]['Hash']
            RequestModel(modelHash)

            while not HasModelLoaded(modelHash) do
                Citizen.Wait(1)
            end

            local created_ped = CreatePed(4, modelHash , Config.NPC[i]['Coords'].x, Config.NPC[i]['Coords'].y, Config.NPC[i]['Coords'].z, Config.NPC[i]['Heading'], Config.NPC[i]['NetworkSync'], false)
            SetEntityAsMissionEntity(created_ped, true, true)
            SetBlockingOfNonTemporaryEvents(created_ped, true)

            Config.NPC[i]['id'] = created_ped
        
            FreezeEntityPosition(Config.NPC[i]['id'], true)
            SetEntityInvincible(Config.NPC[i]['id'], true)

            if Config.Debug then 
                print(Config.NPC[i]['id'])
            end

            if Config.NPC[i]['wantSafe'] then 
                safeHash = Config.NPC[i]['safeHash']
                if not DoesEntityExist(Config.NPC[i]['safeID']) then 
                    createdSafe = CreateObject(safeHash, Config.NPC[i]['safeCoords'].x, Config.NPC[i]['safeCoords'].y, Config.NPC[i]['safeCoords'].z, false, true, false)
                    NetworkRequestControlOfEntity(createdSafe)
                    SetEntityHeading(createdSafe, Config.NPC[i]['safeHeading'])
                    FreezeEntityPosition(createdSafe, true)
                    PlaceObjectOnGroundProperly(createdSafe)
                    Config.NPC[i]['safeID'] = createdSafe
                end
            end 

        end

end)

AddEventHandler('hayden_store:changeHud')
RegisterNetEvent('hayden_store:changeHud', function(timer)
    display = true 
    actualTime = timer
end)

AddEventHandler('onResourceStart', function()
    DeleteEntity(createdSafe)
end)
  
  