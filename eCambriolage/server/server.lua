ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local CopsConnected = 0
local job = ""
RegisterNetEvent("eCambriolage:enter")
AddEventHandler("eCambriolage:enter", function(posCambriolage, posSortie)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(Config.ItemPourCambrioler).count
    local arrive = math.random(1, 2)
    local xPlayers = ESX.GetPlayers()

    local buck = math.random(1, 99999)
    SetPlayerRoutingBucket(source, buck)

    CopsConnected = 0
    for i=1, #xPlayers, 1 do
        local xPlayerss = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayerss.job.name == Config.JobsAlerteSend then CopsConnected = CopsConnected + 1 end
    end

    if CopsConnected >= Config.PoliceRequi then

        if item >= 1 then
            if arrive == 1 then 
                TriggerClientEvent("eCambriolage:canenter", source, posCambriolage, posSortie)                
                local xPlayers = ESX.GetPlayers()
                for i=1, #xPlayers, 1 do
                    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                    local job = xPlayer.getJob()
                    if xPlayer.job.name == Config.JobsAlerteSend then
                        Wait(10000)
                        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LSPD CENTRALE', '~g~Appel d\'un citoyen', 'Cambriolage en cours, regardez votre GPS', 'CHAR_CHAT_CALL', 1)
                        TriggerClientEvent('eCambriolage:blips', xPlayers[i], posSortie)
                    end
                end
                
            else
                local casser = math.random(1, 3)
                if casser == 1 then 
                    xPlayer.removeInventoryItem(Config.ItemPourCambrioler, 1)
                    TriggerClientEvent('esx:showNotification', source, "~r~Votre pied de biche s'est casser")
                    TriggerClientEvent("eCambriolage:noenter", source)
                else
                    TriggerClientEvent('esx:showNotification', source, "~r~Vous avez rater.")
                    TriggerClientEvent("eCambriolage:noenter", source)
                end
            end
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas de "..Config.ItemPourCambrioler)
            TriggerClientEvent("eCambriolage:noenter", source)
        end
    else
        TriggerClientEvent("eCambriolage:noenter2", source)
    end
end)

RegisterNetEvent("eCambriolage:derob")
AddEventHandler("eCambriolage:derob", function(name, label)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(name, 1)
    TriggerClientEvent('esx:showNotification', source, "Vous avez dérober: ~"..Config.CouleurMenu.."~ "..label)
end)

local itenininv = ""
local priceitem = 0
RegisterNetEvent("eCambriolage:recell")
AddEventHandler("eCambriolage:recell", function()
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in pairs(Config.Item) do
        itenininv = v.itemname
        priceitem = v.price
        local itemlist = xPlayer.getInventoryItem(itenininv).count
        local reward = priceitem * itemlist
        if itemlist >= 1 then
            xPlayer.removeInventoryItem(itenininv, itemlist)
            xPlayer.addAccountMoney('black_money', reward)
            print(reward)
            TriggerClientEvent('esx:showNotification', source, "Tu a vendu pour: ~"..Config.CouleurMenu.."~"..reward.."~s~$")
        end
    end
end)

RegisterNetEvent("eCambriolage:setbucket")
AddEventHandler("eCambriolage:setbucket", function()
    local source = source 
    SetPlayerRoutingBucket(source, 0)
end)