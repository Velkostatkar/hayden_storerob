-------------------------------------
--/* Script Made by Hayden#6789 */ --
------------------------------------- 

ESX = nil
tooFar = false 
pcountPolice = 0
display = false


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerDropped', function()
    TriggerEvent('hayden_store:countPolice')
end)

-- This is the actual functionality behind counting police
RegisterNetEvent('hayden_store:countPolice')
AddEventHandler('hayden_store:countPolice', function(source)
	local xPlayers = ESX.GetPlayers()
 	pcountPolice = 0

    for i=1, #xPlayers, 1 do
        local Player = ESX.GetPlayerFromId(xPlayers[i])
        if Player.job.name == 'police' then
           pcountPolice = pcountPolice + 1
        end
    end

    if Config.Debug then 
        print("Cop count updated, current cop count is: " .. pcountPolice)
    end

end)

function hasWeapon()
    for k,v in pairs(Server.RobWeapons) do 
        if GetSelectedPedWeapon(plyPed) == v then 
            return true
        end  
    end 
end 

RegisterNetEvent('hayden_store:robClerk')
AddEventHandler('hayden_store:robClerk', function(i)  
    if not Config.NPC[i]['Robbed'] then
        print(pcountPolice)
        print(i)
        if pcountPolice >= Server.RequiredCops then 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = Translation[Config.Language]['playerRobbing'], length = 2500 })
            TriggerClientEvent('hayden_store:npcAnim', source, i)
            Config.NPC[i]['Robbed'] = true
            TriggerEvent('hayden_store:beginRob', source, i)

            local xPlayers = ESX.GetPlayers()
            for cop = 1, #xPlayers do 
                local xPlayer = ESX.GetPlayerFromId(xPlayers[cop])
                if xPlayer.job.name == 'police' then 
                    TriggerClientEvent('hayden_store:callCops', source, i)
                end 
            end 

            if Config.Debug then 
                print("Player with ID " .. source .. " is robbing a store")
            end 
            
        else 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Translation[Config.Language]['no_cop'], length = 2500 })
        end 
    else 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Translation[Config.Language]['recent'], length = 2500 })
    end 
end)

RegisterNetEvent('hayden_store:beginRob')
AddEventHandler('hayden_store:beginRob', function(source, i)
    local timer = (Server.SetTimer * 1000)
    display = true
    while true do 
        Wait(0)
        
        ply = source 
        plyPed = GetPlayerPed(ply)
        pCoords = GetEntityCoords(plyPed)
    
        sX = Config.NPC[i]['Coords'].x
        sY = Config.NPC[i]['Coords'].y
        sZ = Config.NPC[i]['Coords'].z
        sCoords = vector3(sX, sY, sZ)

        if (#pCoords - #sCoords) > 5 then 
            tooFar = true 
            print("Too far")  
            break  
        else 
            timer = timer - 50
            TriggerClientEvent('hayden_store:changeHud', source, timer) 
            if timer <= 0 then
                timer = 0 
                if not tooFar then 
                    TriggerEvent('hayden_store:reward', source, i ) 
                    timer = 0 
                    return false
                end 
            end 
        end 
    end 
end)

RegisterNetEvent('hayden_store:reward')
AddEventHandler('hayden_store:reward', function(source, i)
    pay = math.random(Server.payMax, Server.payMin)
    xPlayer = ESX.GetPlayerFromId(source)
    -- Compare player coords
    if (#pCoords - #sCoords) < 10 then
        if hasWeapon() then 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = Translation[Config.Language]['success'], length = 2500 })
            xPlayer.addAccountMoney('money', pay)
            TriggerEvent('hayden_store:cooldown', i)
            TriggerClientEvent('hayden_store:stopAnim', source)
            TriggerClientEvent('hayden_store:clearTask', source, i)
            display = false 
            TriggerClientEvent('hayden_store:changeHud', source, display )
            
            if Config.Debug then 
                print("Player with ID " .. source .. " successfully robbed the store")
                display = false 
                TriggerClientEvent('hayden_store:hud', source, display)
            end 

        else 
            TriggerEvent('hayden_store:cooldown', i)
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Translation[Config.Language]['nowep'], length = 2500 })
            
            if Config.Debug then 
                print("Player with ID " .. source .. " couldn't rob a store due to not having the required weapon")
            end 

        end 
    else 
        if Config.Debug then 
            print("Player with ID " .. source .. " tried to rob a store whilst not near one, maybe hacking?")
        end 
    end    
end)

RegisterNetEvent('hayden_store:cooldown')
AddEventHandler('hayden_store:cooldown', function(i)
    Wait(Server.Cooldown * 1000)
    Config.NPC[i]['Robbed'] = false 

    if Config.Debug then 
        print("The store has been refreshed, it can now be robbed again")
    end

end)