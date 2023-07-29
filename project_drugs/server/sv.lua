ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('pfdrugs:getfirst')
AddEventHandler('pfdrugs:getfirst', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('fenyloaceton', 1)
end)

RegisterServerEvent('pfdrugs:getsecond')
AddEventHandler('pfdrugs:getsecond', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('jodowodor', 1)
end)

RegisterServerEvent('pfdrugs:getthird')
AddEventHandler('pfdrugs:getthird', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local fenylo = xPlayer.getInventoryItem("fenyloaceton").count
    local jodo = xPlayer.getInventoryItem("jodowodor").count

    if fenylo > 0 and jodo > 0 then
        xPlayer.removeInventoryItem('fenyloaceton', 1)
        xPlayer.removeInventoryItem('jodowodor', 1)
        xPlayer.addInventoryItem('meta', 1)
    elseif fenylo > 0 and jodo == 0 then
        TriggerClientEvent('okokNotify:Alert', source, '', 'Brakuje ci jodowodoru', 5000, 'info')
    elseif jodo > 0 and fenylo == 0 then
        TriggerClientEvent('okokNotify:Alert', source, '', 'Brakuje ci fenyloacetonu', 5000, 'info')
    else
        TriggerClientEvent('okokNotify:Alert', source, '', 'Brakuje ci jodowodoru i fenyloacetonu', 5000, 'info')
    end
end)

RegisterServerEvent('pfdrugs:getfourth')
AddEventHandler('pfdrugs:getfourth', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local meta = xPlayer.getInventoryItem("meta").count
    local worek = xPlayer.getInventoryItem("nitrile_bag").count

    if meta > 0 and worek > 9 then 
        xPlayer.removeInventoryItem('meta', 1)
        xPlayer.removeInventoryItem('nitrile_bag', 20)
        xPlayer.addInventoryItem('meta_worek', 20)
    elseif meta > 0 and worek <= 9 then 
        TriggerClientEvent('okokNotify:Alert', source, '', 'Brakuje ci worków strunowych', 5000, 'info')
    elseif worek > 9 and meta == 0 then 
        TriggerClientEvent('okokNotify:Alert', source, '', 'Brakuje ci mety', 5000, 'info')
    else
        TriggerClientEvent('okokNotify:Alert', source, '', 'Brakuje ci mety i worków strunowych', 5000, 'info')
    end
end)

RegisterServerEvent('usunlockpiczek')
AddEventHandler('usunlockpiczek', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('lockpick', 1)
end)