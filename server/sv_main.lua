robbedStore = {}
ESX = nil
tooFar = false 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('hayden_store:robClerk')
AddEventHandler('hayden_store:robClerk', function(i)  
    if not Config.NPC[i]['Robbed'] then 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "You're now robbing the store! Keep your gun pointed!", length = 2500 })
        Config.NPC[i]['Robbed'] = true
        TriggerEvent('hayden_store:beginRob', source, i)
    else 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = "This store has been robbed recently!", length = 2500 })
    end 
end)

RegisterNetEvent('hayden_store:beginRob')
AddEventHandler('hayden_store:beginRob', function(source, i)
    local timer = (Server.SetTimer * 1000)
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
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "You have successfully robbed the store!", length = 2500 })
            xPlayer.addAccountMoney('money', pay)
            TriggerEvent('hayden_store:cooldown', i)
            print("Successful robbery")
            TriggerClientEvent('hayden_store:stopAnim', source)
            TriggerClientEvent('hayden_store:clearTask', source, i)
        else 
            print("Ped has no weapon")
            TriggerEvent('hayden_store:cooldown', i)
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = "It appears you don't have the appropriate weapon for this!", length = 2500 })
        end 
    else 
        print(xPlayer .. "tried to rob a store without being close to it")
    end    
end)

RegisterNetEvent('hayden_store:cooldown')
AddEventHandler('hayden_store:cooldown', function(i)
    Wait(Server.Cooldown * 1000)
    Config.NPC[i]['Robbed'] = false 
    print("Can rob")
end)

function hasWeapon()
    for k,v in pairs(Server.RobWeapons) do 
        if GetSelectedPedWeapon(plyPed) == v then 
            return true
        end  
    end 
end 
