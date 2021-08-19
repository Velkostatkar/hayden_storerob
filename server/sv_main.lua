robbedStore = {}
ESX = nil
tooFar = false 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('hayden_store:robClerk')
AddEventHandler('hayden_store:robClerk', function(i)  
    if not Config.NPC[i]['Robbed'] then 
        TriggerEvent('hayden_store:beginRob', source, i)
    else 
        print("Already Robbed")
    end 
end)

RegisterNetEvent('hayden_store:beginRob')
AddEventHandler('hayden_store:beginRob', function(source, i)
    local timer = (Server.SetTimer * 1000)
    while true do 
        Wait(0)

        local ply = source 
        local xPlayer = ESX.GetPlayerFromId(ply)
        plyPed = GetPlayerPed(ply)
        local pCoords = GetEntityCoords(plyPed)
    
        local sX = Config.NPC[i]['Coords'].x
        local sY = Config.NPC[i]['Coords'].y
        local sZ = Config.NPC[i]['Coords'].z
        local sCoords = vector3(sX, sY, sZ)

       if (#sCoords - #pCoords) > 5 or (#sCoords - #pCoords) < -5 then 
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
    -- Compare player coords
    local ply = source 
    local xPlayer = ESX.GetPlayerFromId(ply)
    plyPed = GetPlayerPed(ply)
    local pX,pY,pZ = table.unpack(GetEntityCoords(plyPed))
    local pCoords = pX + pY + pZ

    local sX = Config.NPC[i]['Coords'].x
    local sY = Config.NPC[i]['Coords'].y
    local sZ = Config.NPC[i]['Coords'].z
    local sCoords = sX + sY + sZ

    if (sCoords - pCoords) < 10 then
        if hasWeapon() then 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "You have successfully robbed the store!", length = 2500 })
            xPlayer.addAccountMoney('money', pay)
            TriggerEvent('hayden_store:cooldown', i)
            Config.NPC[i]['Robbed'] = true
        else 
            print("Ped has no weapon")
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
        if GetSelectedPedWeapon(plyPed) == Server.RobWeapons[k] then 
            return true
        end  
    end 
end 
