-- UI
-- Notifications
-- exports['mythic_notify']:SendAlert('type', 'message')

  
ESX = nil

local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
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
                        exports['mythic_notify']:SendAlert('success', "Robbing the store!")
                        TriggerServerEvent('hayden_store:robClerk', i)
                        TriggerEvent('hayden_store:playAnim')
                    end 
                end
            end
        end 
    end 
end)

RegisterNetEvent('hayden_store:playAnim')
AddEventHandler('hayden_store:playAnim', function()
    local pid = PlayerPedId()
    RequestAnimDict("random")
    RequestAnimDict("random@arrests")
    RequestAnimDict("random@arrests@busted")
    while (not HasAnimDictLoaded("random@arrests@busted")) do Citizen.Wait(0) end
    TaskPlayAnim(pid,"random@arrests","idle_2_hands_up",1.0,-1.0, 5000, 0, 1, true, true, true)
end)

RegisterNetEvent('hayden_store:stopAnim')
AddEventHandler('hayden_store:stopAnim', function()
    print("stop anim")

end)

CreateThread(function()

    if Config.Blips then 
        for blipCreate = 1, #Config.BlipLoc do
            local locationPos = Config.BlipLoc[blipCreate]
    
            local blip = AddBlipForCoord(locationPos)
    
            SetBlipSprite (blip, 409)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, 0.8)
            SetBlipColour (blip, 48)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Shop Clerk")
            EndTextCommandSetBlipName(blip)
        end
    end 

    for i = 1, #Config.NPC do 
        modelHash = GetHashKey("mp_m_shopkeep_01")
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(1)
        end

        created_ped = CreatePed(0, modelHash , Config.NPC[i]['Coords'].x, Config.NPC[i]['Coords'].y, Config.NPC[i]['Coords'].z, Config.NPC[i]['Heading'], Config.NPC[i]['NetworkSync'])
        FreezeEntityPosition(created_ped, true)
        SetEntityInvincible(created_ped, true)
        SetBlockingOfNonTemporaryEvents(created_ped, true)
        print("Created")
    end 

end)





