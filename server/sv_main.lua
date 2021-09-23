-------------------------------------
--/* Script Made by Hayden#6789 */ --
------------------------------------- 
local tooFar = false 
local pcountPolice = 0
local display = false

function hasWeapon()
    for k,v in pairs(Server.RobWeapons) do 
        if GetSelectedPedWeapon(plyPed) == v then 
            return true
        end  
    end 
end 

RegisterNetEvent('hayden_store:robClerk')
AddEventHandler('hayden_store:robClerk', function(i, id, ped)  
    math.randomseed(os.time())
    chance = math.random(1, 100)
    local xPlayers = ESX.GetExtendedPlayers('job', 'police')
    if not Config.NPC[i]['Robbed'] then
        if #xPlayers >= Server.RequiredCops then 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = Translation[Config.Language]['playerRobbing'], length = 2500 })
            Config.NPC[i]['Robbed'] = true

            Config.NPC[i]['playerPed'] = ped

            if chance >= Server.AttackChance then 
                
                if Config.Debug then 
                    print("Doing animation")
                end 

                TriggerClientEvent('hayden_store:npcAnim', -1, i)

                TriggerEvent('hayden_store:beginRob', source, i, id)

                local xPlayers = ESX.GetPlayers()
                for cop = 1, #xPlayers do 
                    local xPlayer = ESX.GetPlayerFromId(xPlayers[cop])
                    if xPlayer.job.name == 'police' then 
                        TriggerClientEvent('hayden_store:callCops', -1, i, ped)
                    end 
                end 
    
                if Config.Debug then 
                    print("Player with ID " .. source .. " is robbing a store")
                end 

            else 
                if Config.Debug then 
                    print("Giving weapon to ped, chance is : " .. chance)
                end

                TriggerClientEvent('hayden_store:npcGun', source, i)
            end 

        else 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Translation[Config.Language]['no_cop'], length = 2500 })
        end 
    else 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Translation[Config.Language]['recent'], length = 2500 })
    end 
end)

RegisterNetEvent('hayden_store:beginRob')
AddEventHandler('hayden_store:beginRob', function(source, i, id)
    local timer = (Server.SetTimer * 1000)
    display = true

    while true do 
        Wait(0)

        ply = source 
        plyPed = GetPlayerPed(ply)
        pCoords = GetEntityCoords(plyPed)
        sCoords = Config.NPC[i]['Coords']

        if #(pCoords - sCoords) > 5 then 
            tooFar = true 

            if Config.Debug then 
                print("Too far")
            end
            
            TriggerEvent('hayden_store:cooldown', i)
            TriggerClientEvent('hayden_store:clearTask', source, i)
            display = false 
            TriggerClientEvent('hayden_store:changeHud', source, display )
            
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Translation[Config.Language]['tooFar'], length = 2500 })

            return false 
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

RegisterNetEvent('hayden_store:robSafe')
AddEventHandler('hayden_store:robSafe', function(i, safePed)
    local nearSafe = false
    ply = source 
    plyPed = GetPlayerPed(ply)
    pCoords = GetEntityCoords(plyPed)

    sCoords = Config.NPC[i]['safeCoords']

    Config.NPC[i]['safePed'] = safePed

    for cop = 1, #xPlayers do 
        local xPlayer = ESX.GetPlayerFromId(xPlayers[cop])
        if xPlayer.job.name == 'police' then 
            TriggerClientEvent('hayden_store:callSafe', -1, i, ped)
        end 
    end 

    if #(pCoords - sCoords) < 5 then
        nearSafe = true  
        if not Config.NPC[i]['safeRobbed'] then 
            if nearSafe then
                local xPlayers = ESX.GetPlayers()
                Config.NPC[i]['safeRobbed'] = true
                local safePay = math.random(Server.safeMin, Server.safeMax)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = Translation[Config.Language]['robbedSafe'], length = 2500 })
                TriggerEvent('hayden_store:safeCooldown',i)
            end 
        else 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Translation[Config.Language]['alreadySafeRobbed'], length = 2500 })
        end 
    end 
end)

RegisterNetEvent('hayden_store:reward')
AddEventHandler('hayden_store:reward', function(source, i)
    pay = math.random(Server.payMin, Server.payMax)
    xPlayer = ESX.GetPlayerFromId(source)

    if (#pCoords - #sCoords) < 10 then
        if hasWeapon() then 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = Translation[Config.Language]['success'], length = 2500 })
            xPlayer.addAccountMoney('black_money', pay)
            TriggerEvent('hayden_store:cooldown', i)
            TriggerClientEvent('hayden_store:clearTask', source, i)
            display = false 
            TriggerClientEvent('hayden_store:changeHud', source, display )
            
            if Config.Debug then 
                print("Player with ID " .. source .. " successfully robbed the store")
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

RegisterNetEvent('hayden_store:safeCooldown')
AddEventHandler('hayden_store:safeCooldown', function(i)
    src = source 
    Wait(Server.SafeCooldown * 1000)
    Config.NPC[i]['safeRobbed'] = false
    Config.NPC[i]['safePed'] = nil

    if Config.Debug then 
        print("The safe has been refreshed")
    end
end)

RegisterNetEvent('hayden_store:cooldown')
AddEventHandler('hayden_store:cooldown', function(i)
    src = source 
    Wait(Server.Cooldown * 1000)
    Config.NPC[i]['Robbed'] = false 

    TriggerClientEvent('hayden_store:checkNPC', -1, i)

    Config.NPC[i]['playerPed'] = nil


    if Config.Debug then 
        print("The store has been refreshed, it can now be robbed again")
    end
end)
